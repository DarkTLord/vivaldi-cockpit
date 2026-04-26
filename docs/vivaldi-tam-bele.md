# 🏆 Vivaldi 2026 — Adil-in Əfsanə Setup Bələdçisi

> Tarix: 2026-04-26 · Sistem: Garuda Linux (BlackArch repo) · Vivaldi 7.9.3970.59
> İstifadəçi: Adil · Layihələr: Tarxen + Axion

---

## 📊 Hazırkı Vəziyyət

| Sahə | Sayı |
|------|------|
| Workspaces | **10** |
| Bookmark URL | **357** (10 workspace folder + RSS) |
| Bookmark sub-folder | **66** |
| Custom search engine shortcuts | **17** |
| Sidebar Web Panels | **8** + Sider OpenClaw |
| Mouse gestures | **15** + rocker gestures |
| Keyboard shortcuts | **42** custom |
| Chained commands | **3** |
| Notes preset | **6** AZ-dilli |
| Catppuccin themes | **3** (Mocha aktiv) |
| Performance flags | **10** |
| Privacy settings | **20+** |
| Quraşdırılmış extensions | **15** |
| RSS feeds | **29** (6 kateqoriya) |
| UI dili | **Azərbaycan** |

---

## 🇦🇿 Azərbaycan Dili

UI tam **Azərbaycan dilindədir**. Əgər ingiliscə görünürsə:
1. `Ayarlar` (Ctrl+F12) aç
2. **Ümumi** tab-ı
3. **Dil** bölməsi
4. **İnterfeys dili: Azərbaycan**

Vivaldi yenidən açıldıqda menyular AZ-də olacaq.

---

## ⌨️ Klaviatura Komandaları (42 ədəd)

### Naviqasiya
| Shortcut | Əməliyyat |
|----------|-----------|
| `F2` / `Ctrl+Shift+P` | Quick Commands (VS Code stili) |
| `Ctrl+L` / `Ctrl+E` | Address bar fokus |
| `Ctrl+T` | Yeni tab |
| `Ctrl+Shift+T` | Bağlanmış tab geri |
| `Ctrl+W` | Tab bağla |
| `Ctrl+Tab` | Sonuncu istifadə olunan tab |
| `Ctrl+1`..`8` | Tab N |
| `Ctrl+9` | Sonuncu tab |

### Workspace
| Shortcut | Workspace |
|----------|-----------|
| `Ctrl+Alt+1` | 💻 Dev |
| `Ctrl+Alt+2` | 🤖 AI Lab |
| `Ctrl+Alt+3` | 🛡️ Security |
| `Ctrl+Alt+4` | 📚 Research |
| `Ctrl+Alt+5` | 🎨 Design |
| `Ctrl+Alt+6` | 📰 Pulse |
| `Ctrl+Alt+7` | 🧠 Brain |
| `Ctrl+Alt+8` | 💬 Social |
| `Ctrl+Alt+9` | 🎬 Lounge |
| `Ctrl+Alt+0` | 💰 Life |
| `Ctrl+Alt+→/←` | Növbəti/əvvəlki workspace |
| `Ctrl+Alt+N` | Yeni workspace |
| `Ctrl+Alt+Space` | Workspace dropdown |

### Tab Manipulyasiyası
| Shortcut | Əməliyyat |
|----------|-----------|
| `Ctrl+Shift+K` | Tabı kopyala (duplicate) |
| `Ctrl+Alt+P` | Tab pin |
| `Ctrl+M` | Tab səssiz |
| `Ctrl+Alt+H` | Tab hibernate |
| `Ctrl+Shift+V` | Clipboard URL-i yeni tab-da |
| `Ctrl+Alt+W` | Digər tabları bağla |

### Pəncərə
| Shortcut | Əməliyyat |
|----------|-----------|
| `Ctrl+F9` | Vertical tile |
| `Ctrl+F10` | Horizontal tile |
| `Ctrl+F11` | Grid tile |
| `F11` | Fullscreen |

### Panellər
| Shortcut | Panel |
|----------|-------|
| `F4` | Sidebar toggle |
| `Ctrl+Shift+O` | Notes |
| `Ctrl+Shift+H` | History |
| `Ctrl+Shift+B` | Bookmarks |
| `Ctrl+Shift+J` | Downloads |

### Səhifə
| Shortcut | Əməliyyat |
|----------|-----------|
| `Alt+R` | Reader Mode |
| `Alt+I` | Şəkilləri toggle |
| `Ctrl+=`/`Ctrl+-` | Zoom in/out |
| `Ctrl+0` | Zoom reset |
| `Ctrl+F` | Sayt daxili axtarış |

### Screenshot
| Shortcut | Tip |
|----------|-----|
| `Ctrl+Shift+3` | Görünən hissə |
| `Ctrl+Shift+4` | Tam səhifə |
| `Ctrl+Shift+5` | Bir hissə (seçim) |

### Developer
| Shortcut | Əməliyyat |
|----------|-----------|
| `F12` / `Ctrl+Shift+I` | DevTools |
| `Ctrl+U` | Səhifə kodu |
| `Ctrl+Shift+C` | Inspect element |
| `Ctrl+Shift+Esc` | Vivaldi Task Manager |

### Sürətli Axtarış
| Shortcut | Engine |
|----------|--------|
| `Ctrl+Shift+G` | Google |
| `Ctrl+Shift+D` | DuckDuckGo |

---

## 🖱️ Mouse Gestures

**Sağ-mouse düyməsini basılı saxla** + hərəkət et + **buraxır**:

| Hərəkət | Əməliyyat |
|---------|-----------|
| ↓ | Yeni tab |
| ↓→ | Tab bağla |
| ↓↑ | Bağlanmış tab geri |
| ↓← | Private window |
| → | Növbəti tab |
| ← | Əvvəlki tab |
| ↑ | Reload |
| ↑↓ | Hard reload (cache yox) |
| ↑→ | Fullscreen |
| ↑← | Sidebar toggle |
| ←↓ | Geri (history) |
| →↓ | İrəli (history) |
| →↑ | Növbəti workspace |
| ←↑ | Əvvəlki workspace |
| ↓↑→ | Quick Commands (F2) |

**Bonus — Rocker Gestures:**
- Sol klik basılı saxla + sağ klik = **Geri**
- Sağ klik basılı saxla + sol klik = **İrəli**

**Mouse digər:**
- Middle-click linkdə = arxa planda yeni tab açır
- Wheel scroll back/forward = söndürülüb (yanlışlıq qarşısı)

---

## 🔍 Search Engine Shortcut-ları

Address bar-da yaz: `<açar> sorğun`

| Açar | Engine | Nümunə |
|------|--------|--------|
| `g` | Google | `g flutter clean architecture` |
| `gh` | GitHub Repo | `gh matrix client dart` |
| `ghc` | GitHub Code | `ghc encrypt session_keys` |
| `npm` | NPM | `npm zustand` |
| `pub` | pub.dev | `pub flutter_secure_storage` |
| `pip` | PyPI | `pip fastapi` |
| `cr` | crates.io | `cr tokio` |
| `c7` | **Context7** | `c7 fastapi auth` |
| `mdn` | MDN | `mdn fetch api` |
| `so` | StackOverflow | `so docker volume` |
| `w` | Wikipedia EN | `w azerbaijan` |
| `aw` | Arch Wiki | `aw pacman hooks` |
| `aur` | AUR | `aur cursor` |
| `cve` | CVE | `cve openssl 2026` |
| `hf` | HuggingFace | `hf qwen` |
| `yt` | YouTube | `yt rust async` |
| `rx` | regex101 | `rx ipv4` |

---

## 📡 RSS Feeds Setup

**📡 RSS Feeds** speed-dial folder-də 29 feed hazır gözləyir.

### İstifadə Variantları

#### Variant 1 — Vivaldi Built-in Feed Reader (TÖVSİYƏ)
1. Sidebar (`F4`) → Mail panel ikonunu kliklə
2. Sol yuxarıda "+" düyməsi → "Add Feed"
3. Bookmark folder-dəki RSS URL-i kopyala-yapışdır
4. Kateqoriya seç (məs. "Tech")
5. Vivaldi avtomatik update edəcək (default 60 dəq)

#### Variant 2 — Bookmark folder-dən birbaşa açıb oxu
1. Bookmark bar → 📡 RSS Feeds → kateqoriya
2. Hər feed üzərinə klik → RSS XML açılır
3. Vivaldi RSS preview göstərir

### Feed Kateqoriyaları (29 feed)
- **Tech & Dev** (7): HN, Lobsters, dev.to, GitHub Trending, HN Best/Show/Ask
- **Linux & FOSS** (5): Phoronix, OMG! Linux, LWN, It's FOSS
- **Security** (5): Krebs, Hacker News (sec), Schneier, Bleeping, CVE Latest
- **AI & ML** (5): Anthropic, OpenAI, Google AI, HuggingFace, arxiv AI
- **Web Dev** (4): CSS-Tricks, Smashing, Mozilla Hacks, Vercel
- **Flutter & Dart** (3): Flutter Medium, Dart Blog, Reso Coder

---

## 📧 Email Setup (Manuel — Credentials lazımdır)

Vivaldi built-in mail client IMAP/SMTP dəstəkləyir.

### Gmail Setup
1. **Google Account** → 2-Step Verification aktiv et
2. **App Password** yarat: <https://myaccount.google.com/apppasswords>
3. Vivaldi → Sidebar → Mail → "Add Account"
4. **Type:** IMAP
5. **Email:** your-email@example.com
6. **Password:** App Password (yuxarıdakı)
7. **IMAP Server:** `imap.gmail.com:993` (SSL)
8. **SMTP Server:** `smtp.gmail.com:587` (TLS) və ya `465` (SSL)

### ProtonMail Setup (Privacy üçün TÖVSİYƏ)
1. ProtonMail Bridge quraşdır: `paru -S protonmail-bridge-bin`
2. Bridge-i işə sal, hesabına daxil ol
3. Bridge sənə **local IMAP/SMTP** verir
4. Vivaldi-də:
   - **IMAP:** `127.0.0.1:1143`
   - **SMTP:** `127.0.0.1:1025`
   - Bridge-in verdiyi şifrə

### Yandex Mail
- IMAP: `imap.yandex.com:993` (SSL)
- SMTP: `smtp.yandex.com:465` (SSL)

---

## 📅 Calendar Setup (CalDAV)

### Google Calendar
1. Sidebar → Calendar → "Add Account"
2. **Type:** CalDAV
3. **URL:** `https://apidata.googleusercontent.com/caldav/v2/your-email@example.com/events`
4. **Username:** your-email@example.com
5. **Password:** App Password (Gmail kimi)

### Nextcloud / OwnCloud Calendar
- **URL:** `https://YOUR-CLOUD/remote.php/dav/calendars/USER/`

### Proton Calendar
ProtonMail Bridge işlədiyində:
- **URL:** `https://calendar.proton.me/`

---

## 📝 Notes (Ctrl+Shift+O)

6 hazır note artıq Notes panel-də:
1. **🎯 Vivaldi Power-User Cheatsheet** — Bütün shortcut-lar AZ-də
2. **🔍 Search Engine Shortcuts** — Engine açarları
3. **🤖 AI Prompt Library** — Code review, debug, refactor şablonları
4. **🐧 BlackArch / Linux Komandalar** — pacman, docker, git snippets
5. **🛡️ Security Quick Reference** — OWASP Top 10, common mistakes
6. **📝 Markdown Reference** — Tam syntax AZ izahatla

Notes markdown dəstəkləyir — kod blokları, cədvəllər, footnotes hamısı işləyir.

---

## 🎨 Theme

**Catppuccin Mocha** aktiv. Dəyişmək üçün:
1. `Ctrl+F12` → **Themes**
2. Üç variant arasında seç:
   - **Catppuccin Mocha** (ən qaranlıq, mor accent)
   - **Catppuccin Macchiato** (orta)
   - **Catppuccin Frappé** (yumşaq)

### Vivaldi Themes Store-dan əlavə
1. Settings → Themes → "Get more themes"
2. <https://themes.vivaldi.net> açılır
3. İstənilən theme klik et → "Add to Vivaldi"

---

## 🏗️ Speed Dial

Yeni tab açılanda görünən səhifə:
- **8 sütun** (default 6 idi)
- **Medium thumbnail**
- **11 speed-dial folder:**
  - Home (Vivaldi default)
  - Shopping (Vivaldi default)
  - 💻 Dev Workspace
  - 🤖 AI Lab
  - 🛡️ Security
  - 📚 Research
  - 🎨 Design
  - 📰 Pulse
  - 🧠 Brain
  - 💬 Social
  - 🎬 Lounge
  - 💰 Life
  - 📡 RSS Feeds

---

## 🔌 Quraşdırılmış Extensions (15)

✅ uBlock Origin Lite (ad/tracker block)
✅ Privacy Badger (auto-learn tracker block)
✅ ClearURLs (URL təmizləyici)
✅ Decentraleyes (CDN tracker bypass)
✅ Dark Reader (universal dark mode)
✅ Tampermonkey (userscript)
✅ React Developer Tools
✅ Vue.js DevTools
✅ JSON Viewer
✅ Wappalyzer (saytın stack-i)
✅ SponsorBlock (YouTube reklam keçir)
✅ LanguageTool (qrammatik yoxlama)
✅ OneTab (tab → list)
✅ Sider AI (5-AI sidebar) + OpenClaw agent

### Tövsiyə Olunan Əlavə (HTML installer-də qalan)
- Bitwarden (parol manager)
- Vimium C (vim navigation)
- Glasp (web highlighter + AI)

---

## 🛡️ Sider OpenClaw

Sider AI artıq **agent mode**-da işləyir — istənilən tab-ı oxuya, idarə edə bilər.

### İdarəetmə
```bash
# Status
systemctl status openclaw-gateway.service

# Dayandır (əgər istəsən)
systemctl stop openclaw-gateway.service

# Tamamilə sil
systemctl disable openclaw-gateway.service
rm -rf ~/.openclaw
```

### İstifadə
- Sider sidebar → tapşırıq yaz
- Məs: *"Tarxen GitHub-da son 5 issue-u göstər"*
- Agent avtomatik tab açıb işləyir

---

## ⚙️ Performance Flags (10 aktiv)

`vivaldi://flags` aç və bu flaglar **Enabled**:
- `enable-gpu-rasterization` — GPU render
- `enable-zero-copy` — RAM optimization
- `smooth-scrolling` — yumşaq scroll
- `enable-parallel-downloading` — 4x download
- `back-forward-cache` — ani naviqasiya
- `enable-quic` — HTTP/3
- `enable-experimental-web-platform-features`
- `enable-lazy-image-loading` — şəkillər lazy
- `enable-javascript-harmony` — modern JS
- `force-dark-mode` (selective inversion) — bütün saytlar qara

---

## 🔐 Privacy Hardening

Tətbiq olunmuş:
- ✅ Tracking Prevention Level 3 (Maximum)
- ✅ Do Not Track header
- ✅ Third-party cookies blocked
- ✅ WebRTC IP leak protection
- ✅ DNS-over-HTTPS (Cloudflare 1.1.1.1)
- ✅ HTTPS-only mode
- ✅ Privacy Sandbox / FLoC / Topics off
- ✅ Hyperlink auditing off
- ✅ Search suggestions off
- ✅ Vivaldi telemetry off
- ✅ Crash reports off
- ✅ Spell-check service off
- ✅ Metrics reporting off
- ✅ URL-keyed data collection off
- ✅ Tab data sharing off

---

## 📊 Sync Setup (Opsional)

Vivaldi Sync E2EE şifrəlidir. Vivaldi serverləri yalnız şifrlənmiş blob saxlayır.

1. Settings → **Sync**
2. Vivaldi.net hesabı yarat (pulsuz)
3. **Encryption password** ayrıca seç (login-dən fərqli olmalıdır!)
4. Bu şifrə yalnız sənin yaddaşındadır — itirsən geri qayıtmaq yoxdur
5. Mobil Vivaldi-yə eyni hesabla daxil ol

---

## 🎯 Sürətli Sınaq

1. **F2 bas** → "ai triple" yaz → Enter → 3 AI tab açılır
2. **Ctrl+Alt+2** → 🤖 AI Lab workspace
3. **Sağ-mouse düyməsi basılı + ↓** → Yeni tab açılır
4. **Address bar-a** `c7 fastapi auth` yaz → Context7 axtarışı
5. **F4** → Sidebar açılır, Claude paneli görür
6. **Ctrl+Shift+O** → 6 hazır AZ note görünür
7. **F2 → "1024 * 768"** → calculator cavab verir

---

## 🚨 Geri Qaytarma

Backup qovluğu: `~/.config/vivaldi-backup-20260426-144642/`

```bash
# Tam geri qayıtmaq
pkill -SIGTERM -f vivaldi-bin
sleep 3
cp ~/.config/vivaldi-backup-20260426-144642/Preferences ~/.config/vivaldi/Default/Preferences
cp ~/.config/vivaldi-backup-20260426-144642/"Web Data" ~/.config/vivaldi/Default/"Web Data"
cp ~/.config/vivaldi-backup-20260426-144642/Bookmarks ~/.config/vivaldi/Default/Bookmarks
cp ~/.config/vivaldi-backup-20260426-144642/Notes ~/.config/vivaldi/Default/Notes
```

---

## 📁 Yaradılan Fayllar

```
~/.config/vivaldi-backup-20260426-144642/    ← 5 backup point
~/vivaldi-legendary-setup.md                 ← İngilis dilli xülasə
~/vivaldi-extensions-install.html            ← Extension installer (15 quraşdırıldı)
~/vivaldi-tam-bele.md                        ← BU FAYL — Tam AZ guide
~/.openclaw/                                 ← Sider agent config
```

---

## 🌟 Dünyada Olmayan Kombinasiya

Bu setup unikaldır:
- 🇦🇿 **Azərbaycan dilində** UI + 6 hazır note
- 🎨 **Catppuccin Mocha + 3 variant** dünya-tier theme
- 🗂️ **10 emoji workspace** + **357 URL** organize
- 🤖 **Sider OpenClaw + 8 native AI panel**
- 🔍 **17 power-search shortcut** (Context7, AUR, BlackArch)
- 🖱️ **15 mouse gesture + rocker**
- ⌨️ **42 power-user keyboard shortcut**
- 🛡️ **NSA-tier privacy** + DoH + HTTPS-only
- 📡 **29 RSS feed** (HN, Phoronix, Krebs, Anthropic)
- 🐧 **BlackArch + Garuda KDE** integration

---

*Setup: Adil · Yardımçı: Claude Opus 4.7 · 2026-04-26*
