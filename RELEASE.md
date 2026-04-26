# 🚀 Vivaldi Cockpit v1.0 — Release Notes

> **Released:** 2026-04-26 · **Maintainer:** [@DarkTLord](https://github.com/DarkTLord)
> **Stack:** Linux + Vivaldi 7.9 + Catppuccin Mocha + Local AI

---

## 🎯 What is it?

**Vivaldi Cockpit** is a one-of-a-kind browser power-user setup. Catppuccin
Mocha palette, optional Azerbaijani UI, local AI integration, voice control,
and a unified command center built from 14 distinct CLI tools.

This isn't just a theme — it's a **complete ecosystem**: web dashboard, AI
categorization, GPG-encrypted notes, automated weekly reports, Pomodoro focus
mode, and voice commands powered by a local Whisper model.

---

## ⭐ Highlights

### 🎨 Visual Identity
- **17 custom CSS mods** — Catppuccin Mocha + glassmorphism + animations
- **3 theme variants** (Mocha / Macchiato / Frappé)
- **Custom HTML dashboard** — time-based greeting, live weather,
  HN top 5, daily proverbs, AI prompt of the day, GitHub Pulse widget

### 🌐 i18n Support
- Optional Azerbaijani UI (`az.pak`)
- 6 native AZ-language note presets (Power-User Cheatsheet, Prompt Library, Linux Snippets, Security)
- 18 daily proverbs in dashboard
- Voice commands auto-detect EN + AZ

### 🤖 Local AI Stack
- **Ollama** integration (any installed model)
- **vc-ask** — terminal AI conversation with streaming markdown
- **vc-brief** — daily AI briefing every morning
- **vc-categorize** — bookmark auto-categorization
- **Voice control** — openai-whisper local + ffmpeg

### 🛠️ 14 CLI Tools
| Tool | Purpose |
|------|---------|
| `vc` | Interactive fzf menu (30+ options) |
| `vc-ask` | Local AI chat (Ollama, streaming markdown) |
| `vc-cockpit` | btop-style real-time monitor |
| `vc-find` | Universal search (BM + History + Notes) |
| `vc-voice` | Voice control (4 engine fallback) |
| `vc-server` | FastAPI web dashboard (localhost:8001) |
| `vc-brief` | AI daily briefing |
| `vc-snap` | Workspace snapshot save/restore |
| `vc-focus` | Pomodoro + statistics |
| `vc-weekly` | Weekly report (Markdown + PDF) |
| `vc-categorize` | AI bookmark categorization |
| `vc-share` | GitHub dotfiles helper |
| `vc-note-crypt` | GPG note encryption |
| `vc-bookmark-health.py` | Parallel network bookmark validation |

### 🗂️ Workspaces & Bookmarks
- **10 emoji workspaces**: 💻 Dev, 🤖 AI Lab, 🛡️ Security, 📚 Research,
  🎨 Design, 📰 Pulse, 🧠 Brain, 💬 Social, 🎬 Lounge, 💰 Life
- **390 sample URLs** across 84 folders
- **29 RSS feeds** — 6 categories (Tech/Linux/Security/AI/WebDev/Flutter)
- **17 search shortcuts** (g, gh, c7, npm, pub, aur, cve, hf...)

### 🔐 Privacy & Security
- **Hardened defaults** — 20+ privacy settings
- **DNS-over-HTTPS** (Cloudflare 1.1.1.1)
- **HTTPS-only mode** + WebRTC IP leak protection
- **GPG ed25519** key for note encryption
- **Tracker prevention level 3** (Maximum)

### 🎮 Three Control Modes
1. **Keyboard** — 54 shortcuts + F-key stream deck
2. **Mouse** — 15 gestures + rocker gestures
3. **Voice** — local Whisper transcription, EN + AZ

### ⚡ Automation
- **systemd timer** weekly bookmark health (Sun 03:00)
- **systemd timer** daily AI brief (every morning 08:00)
- **Auto-categorize watcher** (runs after qwen3-coder finishes)

### 🌐 Web Dashboard
**vc-server** at localhost:8001 (FastAPI):
- Live WebSocket metrics
- Universal search
- AI chat web interface
- Quick actions (10+ buttons)
- Focus mode controls
- Workspace snapshot manager
- Daily brief generator
- Bookmark health stats

Add as a sidebar web panel in Vivaldi for always-on access.

---

## 📐 Architecture

```
~/.config/vivaldi/User/custom.css         # 17 UI mods
~/.config/vivaldi/Default/Preferences     # workspaces, search shortcuts
~/.config/vivaldi/Default/Bookmarks       # sample bookmarks
~/.vivaldi-dashboard/index.html            # Custom new tab page

~/.local/bin/vc*                           # 14 CLI tools
~/.local/venvs/vc/                         # Python deps
~/.config/systemd/user/vivaldi-*.timer     # 2 auto timers
~/.cache/vc-*/                             # State files
~/Documents/vivaldi-{briefs,reports,health}/  # Auto outputs
```

---

## 🚀 First Run (5 min)

```bash
# Open new terminal → welcome banner appears
v                          # Interactive menu
vweek                      # Weekly report
vbrief                     # AI brief
vfocus 25                  # Pomodoro
vc-server open             # Web dashboard
```

In Vivaldi:
- `F2` → "AI Quintet" → 5 AI tabs at once
- `Ctrl+Alt+2` → AI Lab workspace
- `F4` → sidebar (Cockpit Server panel)

---

## 📊 By the Numbers

| Metric | Value |
|--------|-------|
| Custom scripts | **14** |
| Lines of code | **~3500** |
| Languages | Bash, Python, JS, CSS, TOML |
| Dependencies | rich, fastapi, uvicorn, weasyprint, openai-whisper |
| Storage | **~250MB** (whisper model + venv) |
| Setup time | **~3 hours** (with AI pair programming) |

---

## 🛣️ Roadmap

- [ ] Vivaldi cloud sync integration
- [ ] Multi-user dotfiles fork support
- [ ] Plasma 6 system tray widget (Cockpit metrics)
- [ ] Public dashboard demo (read-only mode)
- [ ] Plugin architecture for `vc-*` tools
- [ ] More voice engines (Whisper.cpp native, Vosk fallback)
- [ ] Tab state persistence (order, scroll positions)

---

## 🙏 Credits

- **[Catppuccin](https://catppuccin.com)** — color palette
- **[Vivaldi](https://vivaldi.com)** — power-user browser
- **[Ollama](https://ollama.com)** — local LLM platform
- **[OpenAI Whisper](https://github.com/openai/whisper)** — speech recognition
- **[FastAPI](https://fastapi.tiangolo.com)** — web framework
- **Claude Opus 4.7** — pair programming partner

---

## 📜 License

MIT © DarkTLord · 2026

This setup is fully open source. Fork it, customize it, make it more legendary.

> "A single hand cannot make a sound" — proverb
