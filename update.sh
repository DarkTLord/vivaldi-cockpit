#!/usr/bin/env bash
# ╔════════════════════════════════════════════════════════════╗
# ║  Vivaldi Cockpit One-Liner Updater                          ║
# ║  İstifadə: ./update.sh                                      ║
# ║  ya:  curl -sL https://raw.githubusercontent.com/DarkTLord/vivaldi-cockpit/main/update.sh | bash
# ╚════════════════════════════════════════════════════════════╝
set -e

REPO_URL="https://github.com/DarkTLord/vivaldi-cockpit.git"
REPO_DIR="$HOME/vivaldi-cockpit"

# Color codes
G='\033[0;32m'; Y='\033[1;33m'; M='\033[0;35m'; C='\033[0;36m'; N='\033[0m'

echo -e "${M}🔄 Vivaldi Cockpit Updater${N}"
echo ""

if [ -d "$REPO_DIR/.git" ]; then
  # Existing install — update
  cd "$REPO_DIR"
  echo -e "${C}→${N} git pull..."
  git pull origin main
elif [ -d "$HOME/vivaldi-cockpit-dotfiles/.git" ]; then
  # Old name
  cd "$HOME/vivaldi-cockpit-dotfiles"
  echo -e "${C}→${N} git pull (legacy path)..."
  git pull origin main
  REPO_DIR="$HOME/vivaldi-cockpit-dotfiles"
else
  # First clone
  echo -e "${C}→${N} İlk klon: $REPO_DIR"
  git clone "$REPO_URL" "$REPO_DIR"
  cd "$REPO_DIR"
fi

# Install/update mode
echo ""
chmod +x install.sh
./install.sh --update

echo ""
echo -e "${G}✅ Update tamamlandı!${N}"
echo -e "${C}→${N} Yeni terminal aç və ${Y}v${N} yaz"
