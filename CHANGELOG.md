# 📝 Changelog

Bütün vacib dəyişikliklər bu fayla əlavə olunur.

Versiyalanma [Semantic Versioning](https://semver.org/lang/az/) əsasında.

---

## [1.0.0] — 2026-04-26

### 🎉 İlk public release

#### Added
- **15 CLI tool** (vc, vc-ask, vc-cockpit, vc-find, vc-voice, vc-server, vc-brief,
  vc-snap, vc-focus, vc-weekly, vc-categorize, vc-share, vc-note-crypt,
  vc-bookmark-health, vc-cat-watch)
- **vc-server** FastAPI web dashboard (localhost:8001)
- **vc-ask** Local AI conversation (Ollama, 9 models)
- **vc-cockpit** btop-style real-time monitor
- **vc-find** Universal search (Bookmarks + History + Notes)
- **vc-voice** Voice control (openai-whisper + ffmpeg, 4 engine fallback)
- **vc-brief** AI daily briefing (HN + weather + GitHub + Ollama summary)
- **vc-snap** Workspace snapshot save/restore
- **vc-focus** Pomodoro mode with KDE notifications
- **vc-weekly** Weekly config report (Markdown + PDF Catppuccin theme)
- **vc-categorize** AI bookmark categorization (Ollama)
- **vc-note-crypt** GPG ed25519 note encryption
- **vc-bookmark-health** Parallel network bookmark validation
- **17 custom CSS mods** for Vivaldi UI (Catppuccin Mocha)
- **3 Catppuccin theme variants** (Mocha, Macchiato, Frappé)
- **10 emoji workspaces** with 390 organized URLs
- **17 search engine shortcuts** (g, gh, c7, npm, pub, aur, cve, hf...)
- **15 mouse gestures** + rocker gestures
- **54 keyboard shortcuts** including F-key stream deck
- **7 chained commands** (AI Triple, Localhost Triple, etc.)
- **29 RSS feeds** in 6 categories
- **6 native Azerbaijani notes** (cheatsheet, prompts, security, etc.)
- **Custom HTML new tab dashboard** with live HN, weather, AI prompts
- **2 systemd user timers** (weekly health, daily brief)
- **fzf-based interactive menu** for `vc` command
- **Tab completion** via shell aliases
- **Vivaldi sidebar web panel** for vc-server
- **GitHub Pulse widget** in dashboard
- **Auto-categorize watcher** (qwen3-coder:30b)
- **Bundle archive** (.tar.gz) for offline distribution
- **PDF Release Notes** with Catppuccin styling

### Privacy
- DNS-over-HTTPS (Cloudflare)
- HTTPS-only mode
- WebRTC IP leak protection
- Privacy Sandbox / FLoC / Topics disabled
- Tracking Prevention Level 3 (Maximum)
- 20+ privacy hardening settings

### Localization
- Vivaldi UI in Azerbaijani (`az.pak`)
- Voice commands in AZ + EN (auto-detect)
- Dashboard greeting based on time of day (AZ)
- 18 Azerbaijani proverbs

---

## [Unreleased]

### Planned
- [ ] `vc-categorize --apply` real bookmark movement (currently stub)
- [ ] iOS Vivaldi mobile sync integration
- [ ] Plasma 6 widget for system tray
- [ ] Multi-user dotfiles fork support
- [ ] Public read-only dashboard demo
- [ ] GitHub Actions CI for install.sh validation
- [ ] More voice engines (Whisper.cpp native, Vosk fallback)
- [ ] Workspace state persistence (tab order, scroll positions)
- [ ] Smart bookmark auto-merger (semantic dedup)
- [ ] Browser extension marketplace integration
