#!/usr/bin/env bash
set -e
echo "🚀 Vivaldi Cockpit installer"
mkdir -p ~/.local/bin ~/.config/vivaldi/User ~/.vivaldi-dashboard ~/.config/systemd/user
cp scripts/* ~/.local/bin/
chmod +x ~/.local/bin/vc*
cp vivaldi/User/custom.css ~/.config/vivaldi/User/
cp -r vivaldi/dashboard/* ~/.vivaldi-dashboard/
cp systemd/* ~/.config/systemd/user/
[ -f bash/vc-aliases.sh ] && cp bash/vc-aliases.sh ~/.config/
[ -f fish/vc.fish ] && mkdir -p ~/.config/fish/conf.d && cp fish/vc.fish ~/.config/fish/conf.d/
echo "✓ Files copied"

# Python venv
if [ ! -d ~/.local/venvs/vc ]; then
  python3 -m venv ~/.local/venvs/vc
  ~/.local/venvs/vc/bin/pip install rich requests weasyprint markdown reportlab
fi
echo "✓ Python venv"

# Enable systemd timer
systemctl --user daemon-reload
systemctl --user enable --now vivaldi-health.timer 2>/dev/null || true
echo "✓ systemd timer enabled"

# Add to shell
if [ -f ~/.bashrc ] && ! grep -q vc-aliases ~/.bashrc; then
  echo '[ -f ~/.config/vc-aliases.sh ] && source ~/.config/vc-aliases.sh' >> ~/.bashrc
fi

echo ""
echo "✅ Installed! Open a new terminal and type 'v' to begin."
echo "📖 Read docs/vivaldi-tam-bele.md for full guide."
