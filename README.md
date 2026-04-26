# 🚀 Vivaldi Cockpit — A Legendary Power-User Setup

> **Open-source browser power-user toolkit combining Vivaldi 7.9, Catppuccin Mocha,
> local AI, voice control, and a custom CLI dashboard.**

[![CI](https://github.com/DarkTLord/vivaldi-cockpit/actions/workflows/ci.yml/badge.svg)](https://github.com/DarkTLord/vivaldi-cockpit/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/DarkTLord/vivaldi-cockpit?style=flat-square&color=cba6f7)](https://github.com/DarkTLord/vivaldi-cockpit/releases)
[![Stars](https://img.shields.io/github/stars/DarkTLord/vivaldi-cockpit?style=flat-square&color=f9e2af)](https://github.com/DarkTLord/vivaldi-cockpit/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/DarkTLord/vivaldi-cockpit?style=flat-square&color=89b4fa)](https://github.com/DarkTLord/vivaldi-cockpit/commits/main)
[![License](https://img.shields.io/badge/License-MIT-89b4fa?style=flat-square)](LICENSE)

![Catppuccin](https://img.shields.io/badge/Theme-Catppuccin%20Mocha-cba6f7?style=flat-square)
![Vivaldi](https://img.shields.io/badge/Vivaldi-7.9-ef3939?style=flat-square)
![Local AI](https://img.shields.io/badge/AI-Ollama%20Local-a6e3a1?style=flat-square)
![Voice](https://img.shields.io/badge/Voice-Whisper%20Local-fab387?style=flat-square)
![i18n](https://img.shields.io/badge/i18n-EN%20%2B%20AZ-f5c2e7?style=flat-square)

---

## 📸 Screenshots

### 🏠 Custom New Tab Dashboard
*Catppuccin Mocha · time-based greeting · live weather · HN top 5 · daily proverbs · AI prompt of the day*

![Custom Dashboard](docs/screenshots/01-custom-dashboard.png)

### 🌐 vc-server Web Cockpit (localhost:8001)
*FastAPI + WebSocket · live metrics · universal search · AI chat · focus mode · workspace snapshots*

![Cockpit Server](docs/screenshots/02-cockpit-server.png)

### 🖥️ Vivaldi Desktop View
*10 workspaces · 390 bookmarks · 13 sidebar panels · Catppuccin Mocha theme*

![Vivaldi Active](docs/screenshots/03-vivaldi-active.png)

---

## ✨ Highlights

- **🎨 17 custom CSS mods** — Catppuccin Mocha + glassmorphism + animations
- **🗂️ 10 emoji workspaces** — 390 organized URLs across logical domains
- **🤖 Local AI integration** — Ollama (9 models) via `vc-ask`
- **🎙️ Voice control** — speak commands in EN/AZ with local Whisper
- **📊 Real-time monitoring** — btop-style cockpit (`vc-cockpit`)
- **🔍 Universal search** — bookmarks + history + notes (`vc-find`)
- **🔐 GPG-encrypted notes** — ed25519 key (`vc enc`)
- **📅 Weekly auto-reports** — systemd timer + PDF export (`vc-weekly`)
- **🩺 Bookmark health checker** — parallel network validation
- **🛡️ Privacy-hardened** — DoH, HTTPS-only, third-party cookie block
- **⌨️ 54 keyboard shortcuts** — F-keys for workspaces, panels, dev tools
- **🖱️ 15 mouse gestures** — including rocker gestures
- **📡 29 RSS feeds** — Hacker News, Phoronix, Krebs, Anthropic Research
- **🏠 Custom HTML dashboard** — clock, weather, HN top, AI prompts
- **🌐 i18n support** — English (default) + Azerbaijani

## 🎯 The `vc` CLI

Just type `v` in your terminal — interactive fzf menu opens with 30+ commands.

```bash
v               # Interactive menu (fuzzy-search)
vc-ask "..."    # Local AI conversation (Ollama)
vc-find ...     # Universal search
vc-cockpit      # Real-time monitor
vc-voice listen # Voice command (5 sec)
vc-weekly --pdf # Generate report
vc-focus 25     # Pomodoro mode
vc-snap save x  # Workspace snapshot
```

## 📦 Components

| Path | Purpose |
|------|---------|
| `scripts/` | All `vc*` CLI tools (Python + Bash) |
| `vivaldi/User/custom.css` | 17 Catppuccin Mocha UI mods |
| `vivaldi/dashboard/` | Custom HTML new tab page |
| `systemd/` | Weekly health check + daily AI brief timers |
| `fish/`, `bash/` | Shell aliases + welcome banner |
| `docs/` | Full setup guide (English + Azerbaijani) |

## 🚀 Installation

### One-line install (recommended)

```bash
curl -sL https://raw.githubusercontent.com/DarkTLord/vivaldi-cockpit/main/update.sh | bash
```

### Manual

```bash
git clone https://github.com/DarkTLord/vivaldi-cockpit.git ~/vivaldi-cockpit
cd ~/vivaldi-cockpit
./install.sh
```

### Update / Upgrade

```bash
# Quick update (one-liner)
curl -sL https://raw.githubusercontent.com/DarkTLord/vivaldi-cockpit/main/update.sh | bash

# Manual
cd ~/vivaldi-cockpit
./install.sh --update
```

### Install modes

| Command | What it does |
|---------|--------------|
| `./install.sh` | Fresh install (idempotent) |
| `./install.sh --update` | git pull + update |
| `./install.sh --force` | Full reinstall |
| `./install.sh --scripts-only` | Only `~/.local/bin/vc-*` |
| `./install.sh --help` | Help |

### Uninstall

```bash
rm -rf ~/.local/bin/vc* ~/.local/venvs/vc ~/.config/vc-aliases.sh
rm -rf ~/.config/fish/conf.d/vc.fish ~/.vivaldi-dashboard
rm -f ~/.config/vivaldi-cockpit-version
systemctl --user disable --now vivaldi-{health,brief}.timer
```

## 🔧 Requirements

- **OS:** Arch Linux / Garuda / Manjaro / Ubuntu / Fedora (any modern Linux)
- **Browser:** Vivaldi 7.9+
- **Shell:** bash / zsh / fish
- **Required:** `git`, `python3`, `fzf`, `jq`
- **Optional:**
  - **Ollama** for `vc-ask` and AI features (recommended)
  - **ffmpeg** for voice control
  - **GPG** for encrypted notes
  - **systemd** for auto-timers
  - **KDE/notify-send** for desktop notifications

## 🌍 Internationalization

Default UI language is English. To enable Azerbaijani:

```bash
# Run Vivaldi with AZ locale
vivaldi --lang=az

# Or set permanently in Vivaldi:
# Settings → General → Language → User Interface Language → Azerbaijani
```

Voice control auto-detects EN/AZ. Documentation available in both languages under `docs/`.

## 📜 License

MIT © 2026 — see [LICENSE](LICENSE)

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). Fork, adapt, PR improvements.

## ⭐ Star History

If this saved you setup time, please star! It helps others discover the project.

---

> Built with ❤️ for browser power-users who think the terminal and the browser should be unified.
