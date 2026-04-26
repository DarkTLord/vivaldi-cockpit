#!/usr/bin/env bash
# ╔══════════════════════════════════════════════════════════════════╗
# ║  Vivaldi Cockpit Installer & Updater                              ║
# ║                                                                    ║
# ║  Yeni quraşdırma:  ./install.sh                                   ║
# ║  Yeniləmə:         ./install.sh --update                          ║
# ║  Force re-install: ./install.sh --force                           ║
# ║  Yalnız scripts:   ./install.sh --scripts-only                    ║
# ║  Help:             ./install.sh --help                            ║
# ╚══════════════════════════════════════════════════════════════════╝
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VERSION_FILE="$REPO_DIR/VERSION"
INSTALLED_VERSION_FILE="$HOME/.config/vivaldi-cockpit-version"

# Color codes
R='\033[0;31m'; G='\033[0;32m'; Y='\033[1;33m'; B='\033[0;34m'; M='\033[0;35m'; C='\033[0;36m'; N='\033[0m'

# Parse args
MODE="install"
for arg in "$@"; do
  case "$arg" in
    --update|-u) MODE="update" ;;
    --force|-f) MODE="force" ;;
    --scripts-only) MODE="scripts" ;;
    --help|-h)
      sed -n '2,11p' "$0" | sed 's/^# //; s/^#//'
      exit 0 ;;
  esac
done

# Get version
VERSION="1.0.0"
[ -f "$VERSION_FILE" ] && VERSION=$(cat "$VERSION_FILE")
INSTALLED_VERSION=""
[ -f "$INSTALLED_VERSION_FILE" ] && INSTALLED_VERSION=$(cat "$INSTALLED_VERSION_FILE")

# Banner
echo -e "${M}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${M}║  🚀 Vivaldi Cockpit ${C}v${VERSION}${M} — ${MODE^}${N}"
[ -n "$INSTALLED_VERSION" ] && echo -e "${M}║  Hazırkı: ${Y}v${INSTALLED_VERSION}${M} → ${G}v${VERSION}${N}"
echo -e "${M}╚══════════════════════════════════════════════════════════╝${N}"
echo ""

# Update mode: git pull first
if [[ "$MODE" == "update" ]]; then
  echo -e "${B}→${N} git pull origin main..."
  if [ -d "$REPO_DIR/.git" ]; then
    cd "$REPO_DIR"
    git pull origin main 2>&1 | tail -5
    [ -f "$VERSION_FILE" ] && VERSION=$(cat "$VERSION_FILE")
    echo -e "${G}✓${N} Repository yeniləndi → v${VERSION}"
  else
    echo -e "${R}✗${N} Git repo deyil. Clone et:"
    echo "   git clone https://github.com/DarkTLord/vivaldi-cockpit.git"
    exit 1
  fi
  echo ""
fi

# Already installed?
if [[ "$MODE" == "install" ]] && [[ "$INSTALLED_VERSION" == "$VERSION" ]] && [ -n "$INSTALLED_VERSION" ]; then
  echo -e "${Y}⚠${N}  Artıq v${VERSION} quraşdırılıb."
  echo -e "   Yeniləmək üçün: ${C}./install.sh --update${N}"
  echo -e "   Force re-install: ${C}./install.sh --force${N}"
  exit 0
fi

# Check requirements
echo -e "${B}→${N} Tələblər yoxlanır..."
MISSING=()
for cmd in git python3 fzf jq; do
  command -v "$cmd" >/dev/null 2>&1 || MISSING+=("$cmd")
done
if [ ${#MISSING[@]} -gt 0 ]; then
  echo -e "${R}✗${N} Çatışmayan: ${MISSING[*]}"
  echo "   Garuda/Arch: sudo pacman -S ${MISSING[*]}"
  exit 1
fi
echo -e "${G}✓${N} Tələblər tamam"

# Backup existing
if [ -d "$HOME/.config/vivaldi" ] && [[ "$MODE" != "scripts" ]]; then
  echo -e "${B}→${N} Backup yaradılır..."
  BACKUP="$HOME/.config/vivaldi-backup-installer-$(date +%s)"
  mkdir -p "$BACKUP"
  cp "$HOME/.config/vivaldi/Default/Preferences" "$BACKUP/" 2>/dev/null || true
  cp "$HOME/.config/vivaldi/Default/Bookmarks" "$BACKUP/" 2>/dev/null || true
  cp "$HOME/.config/vivaldi/Default/Notes" "$BACKUP/" 2>/dev/null || true
  echo -e "${G}✓${N} Backup: $BACKUP"
fi

# 1. Scripts
echo -e "${B}→${N} CLI scripts → ~/.local/bin/"
mkdir -p ~/.local/bin
SCRIPT_COUNT=0
for f in "$REPO_DIR/scripts/"vc*; do
  [ -f "$f" ] && install -m 755 "$f" ~/.local/bin/ && SCRIPT_COUNT=$((SCRIPT_COUNT+1))
done
echo -e "${G}✓${N} $SCRIPT_COUNT scripts quraşdırıldı"

[[ "$MODE" == "scripts" ]] && {
  echo "$VERSION" > "$INSTALLED_VERSION_FILE"
  echo -e "\n${G}✓ Yalnız scripts mode tamamlandı${N}"
  exit 0
}

# 2. Vivaldi User CSS
if [ -f "$REPO_DIR/vivaldi/User/custom.css" ]; then
  echo -e "${B}→${N} Vivaldi custom.css..."
  mkdir -p ~/.config/vivaldi/User
  cp "$REPO_DIR/vivaldi/User/custom.css" ~/.config/vivaldi/User/
  echo -e "${G}✓${N} CSS quraşdırıldı"
fi

# 3. Custom Dashboard
if [ -d "$REPO_DIR/vivaldi/dashboard" ]; then
  echo -e "${B}→${N} Custom dashboard..."
  mkdir -p ~/.vivaldi-dashboard
  cp -r "$REPO_DIR/vivaldi/dashboard/"* ~/.vivaldi-dashboard/ 2>/dev/null || true
  echo -e "${G}✓${N} Dashboard quraşdırıldı"
fi

# 4. systemd timers
if [ -d "$REPO_DIR/systemd" ]; then
  echo -e "${B}→${N} systemd user timers..."
  mkdir -p ~/.config/systemd/user
  cp "$REPO_DIR/systemd/"*.{service,timer} ~/.config/systemd/user/ 2>/dev/null || true
  systemctl --user daemon-reload
  for timer in vivaldi-health.timer vivaldi-brief.timer; do
    [ -f ~/.config/systemd/user/$timer ] && systemctl --user enable --now "$timer" 2>/dev/null || true
  done
  echo -e "${G}✓${N} Timers aktivləşdirildi"
fi

# 5. Shell aliases
echo -e "${B}→${N} Shell aliases..."
[ -f "$REPO_DIR/bash/vc-aliases.sh" ] && cp "$REPO_DIR/bash/vc-aliases.sh" ~/.config/
[ -f "$REPO_DIR/fish/vc.fish" ] && {
  mkdir -p ~/.config/fish/conf.d
  cp "$REPO_DIR/fish/vc.fish" ~/.config/fish/conf.d/
}
for rc in ~/.bashrc ~/.zshrc; do
  [ -f "$rc" ] && ! grep -q vc-aliases "$rc" && {
    echo '' >> "$rc"
    echo '# Vivaldi Cockpit aliases' >> "$rc"
    echo '[ -f ~/.config/vc-aliases.sh ] && source ~/.config/vc-aliases.sh' >> "$rc"
  }
done
echo -e "${G}✓${N} Aliases quraşdırıldı"

# 6. Python venv
if [ ! -d ~/.local/venvs/vc ] || [[ "$MODE" == "force" ]]; then
  echo -e "${B}→${N} Python venv (~150MB)..."
  python3 -m venv ~/.local/venvs/vc
  ~/.local/venvs/vc/bin/pip install --quiet --upgrade pip
  ~/.local/venvs/vc/bin/pip install --quiet \
    rich requests fastapi uvicorn websockets jinja2 \
    weasyprint markdown reportlab openai-whisper
  echo -e "${G}✓${N} Python venv hazırdır"
else
  echo -e "${B}→${N} Python paketlər yenilənir..."
  ~/.local/venvs/vc/bin/pip install --quiet --upgrade \
    rich requests fastapi uvicorn weasyprint markdown openai-whisper
  echo -e "${G}✓${N} Paketlər güncəlləndi"
fi

# 7. Mark version installed
echo "$VERSION" > "$INSTALLED_VERSION_FILE"

# Final
echo ""
echo -e "${M}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${M}║  ${G}✅ ${MODE^} TAMAMLANDI${N}                                       ${M}║${N}"
echo -e "${M}║  ${C}v${VERSION}${N} quraşdırıldı                                    ${M}║${N}"
echo -e "${M}╚══════════════════════════════════════════════════════════╝${N}"
echo ""
echo -e "${B}İndi:${N}"
echo -e "  ${C}1.${N} Yeni terminal aç (welcome banner görəcəksən)"
echo -e "  ${C}2.${N} ${Y}v${N} yaz (interaktiv menyu)"
echo -e "  ${C}3.${N} ${Y}vc-server start${N} (web dashboard)"
echo -e "  ${C}4.${N} ${Y}vbrief${N} (AI daily briefing)"
echo ""
echo -e "${B}Yeniləmək üçün:${N}"
echo -e "  ${Y}cd $REPO_DIR && ./install.sh --update${N}"
