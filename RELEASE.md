# 🚀 Vivaldi Cockpit v1.0 — Release Notes

> **Released:** 2026-04-26 · **Author:** Adil ([@DarkTLord](https://github.com/DarkTLord))
> **Stack:** Garuda Linux + Vivaldi 7.9 + Catppuccin Mocha + Local AI

---

## 🎯 Nədir?

**Vivaldi Cockpit** dünyada birə-bir browser power-user setup-ıdır. Catppuccin
Mocha rəng paleti, Azərbaycan dili UI, lokal AI inteqrasiyası, səs idarəsi və
14 fərqli CLI alətindən ibarət vahid command center.

Bu sadəcə bir tema deyil — **tam ekosistem**: web dashboard, AI kateqoriyalaşdırma,
GPG-şifrəli notes, otomatik həftəlik raportlar, Pomodoro fokus modu, və yerli
Whisper modeli ilə səs komandaları.

---

## ⭐ Highlights

### 🎨 Visual Identity
- **17 custom CSS mod** — Catppuccin Mocha + glassmorphism + animasiyalar
- **3 theme variant** (Mocha / Macchiato / Frappé)
- **Custom HTML dashboard** — saata görə salamlama, Bakı havası,
  HN top 5, AZ atalar sözü, AI prompt günün, GitHub Pulse widget

### 🇦🇿 Native Azerbaijani
- Tam UI Azərbaycan dilində (`az.pak`)
- 6 hazır AZ-dilli note (Power-User Cheatsheet, Prompt Library, Linux Snippets, Security)
- 18 atalar sözü dashboard-da
- Voice komandalar AZ + EN avtomat tanıma

### 🤖 Local AI Stack
- **Ollama 9 model** quraşdırılı (deepseek-r1, qwen3-coder, mistral, custom targen-*)
- **vc-ask** — terminal-da AI conversation
- **vc-brief** — hər səhər AI daily briefing
- **vc-categorize** — bookmark-ları AI ilə təsnif
- **Voice control** — openai-whisper local + ffmpeg

### 🛠️ 14 CLI Tool
| Tool | Məqsəd |
|------|--------|
| `vc` | İnteraktiv fzf menyu (30 seçim) |
| `vc-ask` | Local AI chat (Ollama, streaming markdown) |
| `vc-cockpit` | btop-stili real-time monitor |
| `vc-find` | Universal search (BM + History + Notes) |
| `vc-voice` | Səslə browser idarəsi (4 engine) |
| `vc-server` | FastAPI web dashboard (localhost:8001) |
| `vc-brief` | AI daily briefing |
| `vc-snap` | Workspace snapshot save/restore |
| `vc-focus` | Pomodoro + statistika |
| `vc-weekly` | Həftəlik raport (Markdown + PDF) |
| `vc-categorize` | AI bookmark təsnifatı |
| `vc-share` | GitHub dotfiles |
| `vc-note-crypt` | GPG note encryption |
| `vc-bookmark-health.py` | Network bookmark validation |

### 🗂️ Workspaces & Bookmarks
- **10 emoji workspace**: 💻 Dev, 🤖 AI Lab, 🛡️ Security, 📚 Research,
  🎨 Design, 📰 Pulse, 🧠 Brain, 💬 Social, 🎬 Lounge, 💰 Life
- **390 bookmark URL** — 84 folder daxilində
- **29 RSS feed** — 6 kateqoriya (Tech/Linux/Security/AI/WebDev/Flutter)
- **17 search shortcut** (g, gh, c7, npm, pub, aur, cve, hf...)

### 🔐 Privacy & Security
- **NSA-tier hardening** — 20+ privacy setting
- **DNS-over-HTTPS** Cloudflare 1.1.1.1
- **HTTPS-only mode** + WebRTC IP leak qoruması
- **GPG ed25519** açar notes encryption üçün
- **Tracker prevention level 3** (Maximum)

### 🎮 Control Modes (3)
1. **Klaviatura** — 54 shortcut + F-key stream deck
2. **Mouse** — 15 gesture + rocker gestures
3. **Voice** — local Whisper, AZ + EN

### ⚡ Automation
- **systemd timer** weekly bookmark health (bazar 03:00)
- **systemd timer** daily AI brief (hər səhər 08:00)
- **Auto categorize watcher** (qwen3-coder bitincə apply)

### 🌐 Web Dashboard
**vc-server** localhost:8001-də FastAPI server:
- Live WebSocket metrics
- Universal search
- AI chat web interface
- Quick actions (10+ buttons)
- Focus mode controls
- Workspace snapshot manager
- Daily brief generator
- Bookmark health stats

Vivaldi-də sidebar web panel kimi əlavə olunur — daimi açıq.

---

## 📐 Arxitektura

```
~/.config/vivaldi/User/custom.css         # 17 UI mod
~/.config/vivaldi/Default/Preferences     # 10 workspace, 17 search
~/.config/vivaldi/Default/Bookmarks       # 390 URL
~/.vivaldi-dashboard/index.html            # Custom new tab page

~/.local/bin/vc*                           # 14 CLI tool
~/.local/venvs/vc/                         # Python deps
~/.config/systemd/user/vivaldi-*.timer     # 2 auto timer
~/.cache/vc-*/                             # State files
~/Documents/vivaldi-{briefs,reports,health}/  # Auto outputs
```

---

## 🚀 İlk Sınaq (5 dəq)

```bash
# Yeni terminal aç → welcome banner görəcəksən
v                          # İnteraktiv menyu
vweek                      # Həftəlik raport
vbrief                     # AI brief
vfocus 25                  # Pomodoro
vc-server open             # Web dashboard
```

Vivaldi-də:
- `F2` → "AI Quintet" → 5 AI birdən
- `Ctrl+Alt+2` → AI Lab workspace
- `F4` → sidebar (Cockpit Server panel)

---

## 📊 By the Numbers

| Metrika | Dəyər |
|---------|-------|
| Custom scripts | **14** |
| Lines of code | **~3500** |
| Languages | Bash, Python, JS, CSS, TOML |
| Dependencies | rich, fastapi, uvicorn, weasyprint, openai-whisper |
| Storage | **~250MB** (whisper model + venv) |
| Setup time | **~3 saat** (Claude Opus 4.7 ilə) |
| Backup points | **6** (rollback hazır) |

---

## 🛣️ Roadmap

- [ ] Vivaldi cloud sync inteqrasiyası
- [ ] Multi-user dotfiles fork dəstəyi
- [ ] Plasma 6 widget (Cockpit metric tray-də)
- [ ] iOS Vivaldi mobile sync
- [ ] Public dashboard demo (read-only mode)

---

## 🙏 Credits

- **Catppuccin** — rəng paleti
- **Vivaldi** — power-user browser
- **Ollama** — local LLM platform
- **OpenAI Whisper** — speech recognition
- **FastAPI** — web framework
- **Claude Opus 4.7** — pair programming partner

---

## 📜 License

MIT © Adil (DarkTLord) · 2026

Bu setup tam açıq mənbədir. Fork et, dəyişdir, daha əfsanə et.

> "Tək əldən səs çıxmaz" — Azərbaycan atalar sözü
