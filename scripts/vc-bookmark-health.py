#!/usr/bin/env python3
"""
Vivaldi Bookmark Health Check — Adil's tool.
Skan: ölü linklər, duplicate, kategoriyasız bookmarks.
İstifadə: vc health
"""
import json
import sys
from pathlib import Path
from collections import defaultdict
from urllib.parse import urlparse
from concurrent.futures import ThreadPoolExecutor, as_completed
import urllib.request
import socket

BOOKMARKS = Path.home() / ".config/vivaldi/Default/Bookmarks"

# ANSI colors
class C:
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    RESET = '\033[0m'
    BOLD = '\033[1m'
    DIM = '\033[2m'

def collect_bookmarks(node, path="", out=None):
    if out is None: out = []
    if node.get("type") == "url":
        out.append({
            "name": node.get("name", ""),
            "url": node.get("url", ""),
            "path": path
        })
    elif node.get("type") == "folder":
        new_path = f"{path}/{node.get('name', '?')}" if path else node.get('name', '?')
        for c in node.get("children", []):
            collect_bookmarks(c, new_path, out)
    elif "children" in node:
        for c in node["children"]:
            collect_bookmarks(c, path, out)
    elif "roots" in node:
        for r in node["roots"].values():
            collect_bookmarks(r, "", out)
    return out

def check_url(bm, timeout=5):
    """Returns (status_code, error). Status 0 = error."""
    url = bm["url"]
    try:
        # Skip non-HTTP and special URLs
        scheme = urlparse(url).scheme
        if scheme not in ("http", "https"):
            return (None, "skip")
        req = urllib.request.Request(url, method="HEAD",
            headers={"User-Agent": "Mozilla/5.0 (Vivaldi BM Check)"})
        try:
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return (resp.status, None)
        except urllib.error.HTTPError as e:
            # HEAD might fail, try GET
            if e.code in (405, 501):
                req = urllib.request.Request(url, method="GET",
                    headers={"User-Agent": "Mozilla/5.0 (Vivaldi BM Check)"})
                with urllib.request.urlopen(req, timeout=timeout) as resp:
                    return (resp.status, None)
            return (e.code, str(e))
    except (urllib.error.URLError, socket.timeout, ConnectionError) as e:
        return (0, str(e))
    except Exception as e:
        return (0, str(e))

def main():
    if not BOOKMARKS.exists():
        print(f"{C.RED}✗ Bookmark faylı tapılmadı{C.RESET}")
        sys.exit(1)

    data = json.loads(BOOKMARKS.read_text())
    bookmarks = collect_bookmarks(data)

    print(f"{C.BOLD}{C.PURPLE}╔══════════════════════════════════════════════════╗{C.RESET}")
    print(f"{C.BOLD}{C.PURPLE}║  Vivaldi Bookmark Health Check — Adil           ║{C.RESET}")
    print(f"{C.BOLD}{C.PURPLE}╚══════════════════════════════════════════════════╝{C.RESET}")
    print()
    print(f"📑 Cəmi bookmark: {C.CYAN}{len(bookmarks)}{C.RESET}")

    # ── DUPLICATE CHECK ──────────────────────────────────────────
    print(f"\n{C.BOLD}{C.YELLOW}🔍 1. Duplicate URL-lər{C.RESET}")
    url_map = defaultdict(list)
    for bm in bookmarks:
        url_map[bm["url"]].append(bm)
    dupes = {u: lst for u, lst in url_map.items() if len(lst) > 1}
    if not dupes:
        print(f"  {C.GREEN}✓ Duplicate yoxdur{C.RESET}")
    else:
        print(f"  {C.YELLOW}⚠ {len(dupes)} URL təkrar olunur:{C.RESET}")
        for url, lst in list(dupes.items())[:10]:
            print(f"  {C.DIM}─ {url}{C.RESET}")
            for bm in lst:
                print(f"    └ {bm['path']}/{bm['name']}")

    # ── EMPTY NAME CHECK ─────────────────────────────────────────
    print(f"\n{C.BOLD}{C.YELLOW}🔍 2. Adsız bookmark-lar{C.RESET}")
    nameless = [b for b in bookmarks if not b["name"].strip()]
    if not nameless:
        print(f"  {C.GREEN}✓ Hamısının adı var{C.RESET}")
    else:
        print(f"  {C.YELLOW}⚠ {len(nameless)} adsız bookmark{C.RESET}")
        for b in nameless[:5]:
            print(f"    {C.DIM}{b['url']}{C.RESET}")

    # ── INVALID URL CHECK ────────────────────────────────────────
    print(f"\n{C.BOLD}{C.YELLOW}🔍 3. Sintaksis baxımından xətalı URL-lər{C.RESET}")
    invalid = []
    for b in bookmarks:
        try:
            p = urlparse(b["url"])
            if not p.scheme or not p.netloc:
                if p.scheme not in ("file", "javascript", "data", "vivaldi", "chrome"):
                    invalid.append(b)
        except: invalid.append(b)
    if not invalid:
        print(f"  {C.GREEN}✓ Hamısı düzgündür{C.RESET}")
    else:
        print(f"  {C.YELLOW}⚠ {len(invalid)} xətalı URL{C.RESET}")
        for b in invalid[:5]:
            print(f"    {b['name']}: {b['url']}")

    # ── DOMAIN STATS ─────────────────────────────────────────────
    print(f"\n{C.BOLD}{C.BLUE}📊 4. Domain top-10 (ən çox işlənən){C.RESET}")
    domains = defaultdict(int)
    for b in bookmarks:
        try:
            d = urlparse(b["url"]).netloc
            if d: domains[d] += 1
        except: pass
    top = sorted(domains.items(), key=lambda x: -x[1])[:10]
    for d, c in top:
        bar = '█' * min(c, 30)
        print(f"  {C.CYAN}{c:3d}{C.RESET} {bar} {d}")

    # ── DEAD LINK CHECK (parallel) ───────────────────────────────
    print(f"\n{C.BOLD}{C.YELLOW}🔍 5. Ölü linklər (network sınağı){C.RESET}")
    print(f"  {C.DIM}{len(bookmarks)} URL paralel yoxlanır...{C.RESET}")

    dead = []
    redirected = []
    ok_count = 0
    skipped = 0

    with ThreadPoolExecutor(max_workers=20) as pool:
        futures = {pool.submit(check_url, bm): bm for bm in bookmarks}
        for i, fut in enumerate(as_completed(futures), 1):
            bm = futures[fut]
            status, err = fut.result()
            if status is None:
                skipped += 1
            elif status == 0:
                dead.append((bm, err))
            elif status >= 400:
                dead.append((bm, f"HTTP {status}"))
            elif 300 <= status < 400:
                redirected.append((bm, f"HTTP {status}"))
            else:
                ok_count += 1
            # Progress
            if i % 25 == 0 or i == len(bookmarks):
                pct = (i / len(bookmarks)) * 100
                print(f"  {C.DIM}  Progress: {i}/{len(bookmarks)} ({pct:.0f}%){C.RESET}", end='\r')

    print(f"  {C.GREEN}✓ Sağlam: {ok_count}{C.RESET}                                    ")
    print(f"  {C.YELLOW}↪ Redirect: {len(redirected)}{C.RESET}")
    print(f"  {C.DIM}— Atlanıldı (file/js/etc): {skipped}{C.RESET}")
    if dead:
        print(f"  {C.RED}✗ Ölü linklər ({len(dead)}):{C.RESET}")
        for bm, err in dead[:20]:
            print(f"    {C.RED}─ {bm['path']}/{bm['name']}{C.RESET}")
            print(f"      {C.DIM}{bm['url']}{C.RESET}")
            print(f"      {C.DIM}{err[:80]}{C.RESET}")
        if len(dead) > 20:
            print(f"    {C.DIM}...və daha {len(dead)-20} ədəd{C.RESET}")
    else:
        print(f"  {C.GREEN}✓ Ölü link tapılmadı{C.RESET}")

    # ── SUMMARY ──────────────────────────────────────────────────
    health_score = (ok_count / len(bookmarks)) * 100 if bookmarks else 0
    color = C.GREEN if health_score > 90 else C.YELLOW if health_score > 70 else C.RED
    print(f"\n{C.BOLD}╔══════════════════════════════════════════╗{C.RESET}")
    print(f"{C.BOLD}║  Health Score: {color}{health_score:5.1f}%{C.RESET}{C.BOLD}                  ║{C.RESET}")
    print(f"{C.BOLD}╚══════════════════════════════════════════╝{C.RESET}")

    # Export dead links
    if dead:
        outpath = Path.home() / "vivaldi-dead-bookmarks.txt"
        with outpath.open("w") as f:
            for bm, err in dead:
                f.write(f"{bm['path']}/{bm['name']}\n  URL: {bm['url']}\n  Error: {err}\n\n")
        print(f"\n💾 Ölü linklər saxlanıldı: {C.CYAN}{outpath}{C.RESET}")

if __name__ == "__main__":
    main()
