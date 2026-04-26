# Vivaldi 2026 Legendary Setup — Adil's Power Configuration

> Generated 2026-04-26. Hardware: Garuda Linux + KDE. User: Adil (Tarxen + Axion projects).

## Quick Index
1. [Privacy Hardening](#privacy-hardening)
2. [Performance Flags](#performance-flags)
3. [Workspaces](#workspaces)
4. [Sidebar AI Web Panels](#sidebar-ai-web-panels)
5. [Extension Arsenal](#extension-arsenal)
6. [Custom Search Engines](#custom-search-engines)
7. [Tab Mastery](#tab-mastery)
8. [Theme & Eye Comfort](#theme--eye-comfort)
9. [Mouse Gestures + Shortcuts](#mouse-gestures--shortcuts)
10. [Built-in Tools](#built-in-tools)

---

## Privacy Hardening

### Settings → Privacy and Security
| Setting | Value |
|---------|-------|
| Tracking & Ad Blocking | **Block Trackers and Ads** |
| Default Search | **Brave Search** |
| Send Usage Statistics | **Off** |
| Crash Reports | **Off** |
| Phishing & Malware Protection | **On** |
| Hyperlink Auditing | **Off** |
| WebRTC IP Handling | **Disable Non-Proxied UDP** |
| DNS-over-HTTPS | **Cloudflare 1.1.1.1** |
| Do Not Track | **On** |
| Block third-party cookies | **On** |

### Permissions (`vivaldi://settings/content`)
- Camera/Mic/Location → Ask before access
- Notifications → Block by default
- Background sync → Off

---

## Performance Flags

`vivaldi://flags` — set each to **Enabled**:

```
#enable-gpu-rasterization
#enable-zero-copy
#smooth-scrolling
#enable-parallel-downloading
#back-forward-cache
#enable-quic
#enable-experimental-web-platform-features
```

### Settings → General → Startup
- ✅ Lazy Load Restored Tabs
- ✅ Tab Hibernation: Auto after 60 minutes

---

## Workspaces

Tab bar → right-click → "Workspaces" → "New Workspace"

| Workspace | Color | Content |
|-----------|-------|---------|
| 🟦 Tarxen | Blue | Tarxen GitHub, docs, Linear, deploy |
| 🟪 Axion | Purple | Axion repo, Matrix docs, l10n, Crowdin |
| 🟩 AI/Research | Green | Claude.ai, ChatGPT, Perplexity, Context7 |
| 🟧 Personal | Orange | Email, banking, YouTube, social |
| 🔴 Security | Red | BlackArch tools, exploit-db, CVE feed |

**Keyboard:** `Ctrl+Alt+1/2/3/4/5` to switch.

---

## Sidebar AI Web Panels

Sidebar `+` button → Add URL:

| Panel | URL |
|-------|-----|
| Claude | `https://claude.ai` |
| ChatGPT | `https://chat.openai.com` |
| Perplexity | `https://www.perplexity.ai` |
| Context7 | `https://context7.com` |
| Gemini | `https://gemini.google.com` |

**Keyboard:** `F4` toggle, `Ctrl+Shift+1/2/3` switch panels.

---

## Extension Arsenal

### Privacy
- uBlock Origin Lite
- Privacy Badger
- Bypass Paywalls Clean
- ClearURLs
- Decentraleyes

### Developer
- React Developer Tools
- Vue.js DevTools
- JSON Viewer
- Wappalyzer
- EditThisCookie
- Tampermonkey

### Productivity
- Bitwarden
- Vimium C
- SponsorBlock
- Dark Reader
- LanguageTool
- OneTab

### AI
- Sider (5-AI sidebar)
- Glasp (web highlighter)

---

## Custom Search Engines

Settings → Search → Add. Address bar usage: `<keyword> query`

| Keyword | Engine | URL |
|---------|--------|-----|
| `g` | Google | `https://google.com/search?q=%s` |
| `ddg` | DuckDuckGo | `https://duckduckgo.com/?q=%s` |
| `gh` | GitHub | `https://github.com/search?q=%s&type=repositories` |
| `npm` | NPM | `https://www.npmjs.com/search?q=%s` |
| `pub` | pub.dev | `https://pub.dev/packages?q=%s` |
| `mdn` | MDN | `https://developer.mozilla.org/en-US/search?q=%s` |
| `c7` | Context7 | `https://context7.com/search?q=%s` |
| `aur` | AUR | `https://aur.archlinux.org/packages?K=%s` |
| `cve` | CVE | `https://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=%s` |
| `yt` | YouTube | `https://www.youtube.com/results?search_query=%s` |

---

## Tab Mastery

Settings → Tabs:
- Tab Position: **Left** (vertical)
- Tab Stacking: **Two-Level**
- Tab Cycling: **Recently Used**
- Pin Mode: **Always show**
- New Tab Position: **Related Tab**
- Tab Hibernation: **Auto after 60 min**

---

## Theme & Eye Comfort

- Theme: **Vivaldi Dark** or import **Catppuccin Mocha**
- Window background: `#1e1e2e`
- Accent: From active page (dynamic)
- `vivaldi://flags` → `#force-dark-mode` → **Enabled with selective inversion**
- Use built-in Reader Mode for long articles

---

## Mouse Gestures + Shortcuts

### Mouse gestures (right-click + drag)
| Gesture | Action |
|---------|--------|
| ↓ | New tab |
| ↓→ | Close tab |
| → | Next tab |
| ← | Previous tab |
| ↑↓ | Reload |
| ↑→ | Reopen closed tab |

### Keyboard
| Shortcut | Action |
|----------|--------|
| `F2` | Quick Commands |
| `Ctrl+E` | Address bar |
| `Ctrl+Shift+T` | Reopen closed tab |
| `Ctrl+Tab` | Next tab |
| `F4` | Sidebar toggle |
| `F11` | Fullscreen |
| `Ctrl+W` | Close tab |
| `Ctrl+Shift+S` | Screenshot |
| `Ctrl+Shift+O` | Notes panel |

---

## Built-in Tools

- **Notes (Ctrl+Shift+O)** — architecture notes
- **Mail Client (F4 → mail icon)** — IMAP setup
- **Calendar** — Google Calendar sync
- **RSS Reader** — algorithm-free feed
- **Translator** — Yandex, offline option
- **Screenshot Tool (Ctrl+Shift+S)** — full page, area, annotation

---

## Apply Order

1. Run config script → applies privacy, performance, search engines, tabs
2. Restart Vivaldi
3. Manual: workspaces, web panels, extensions
4. Manual: theme tweaks, mouse gestures
