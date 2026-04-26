# 🤝 Contributing to Vivaldi Cockpit

Vivaldi Cockpit-ə töhfə vermək istədiyin üçün təşəkkür! 🎉

## 🚀 Sürətli Başlanğıc

```bash
git clone https://github.com/DarkTLord/vivaldi-cockpit.git
cd vivaldi-cockpit
git checkout -b feat/yeni-feature
# kod yaz
./install.sh --force      # test et
git commit -m "feat: yeni-feature"
git push origin feat/yeni-feature
# GitHub-da PR yarat
```

## 📋 Pull Request Checklist

- [ ] **Fork + branch:** `feat/`, `fix/`, `docs/`, `refactor/` prefiksindən istifadə et
- [ ] **Test:** `./install.sh --force` lokal işləyir
- [ ] **Lint:** `shellcheck scripts/*.sh` warning-siz
- [ ] **Commit message:** [Conventional Commits](https://www.conventionalcommits.org/) — `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`
- [ ] **CHANGELOG:** Vacib dəyişikliklər `[Unreleased]` bölməsinə əlavə olundu
- [ ] **README/docs:** Lazım olarsa yeniləndi
- [ ] **Backwards compatible:** Mövcud script-lər sınmır

## 🎯 Töhfə Növləri

### 🪄 Yeni `vc-*` Tool
1. `scripts/vc-yenitool` yarat (bash/python)
2. Shebang düzgün olmalıdır:
   - Bash: `#!/usr/bin/env bash`
   - Python: `#!/usr/bin/env -S /home/blackarch/.local/venvs/vc/bin/python3`
3. `chmod +x scripts/vc-yenitool`
4. `vc` menyusuna əlavə et (scripts/vc-də)
5. `bash/vc-aliases.sh` + `fish/vc.fish`-ə alias əlavə et
6. README-yə qeyd et

### 🎨 Vivaldi UI Mod
1. `vivaldi/User/custom.css`-ə yeni rule
2. Catppuccin Mocha rəng paletindən istifadə et:
   - `--mauve: #cba6f7` (accent)
   - `--blue: #89b4fa`
   - `--text: #cdd6f4`
3. CSS selector Vivaldi-yə uyğun olsun (DevTools ilə yoxla)

### 📚 Dokumentasiya
- `docs/` qovluğunda Markdown
- README dilləri: AZ + EN
- Screenshot-lar `docs/screenshots/`

### 🐛 Bug Fix
- Issue link et (PR description-da `Closes #N`)
- Test case əlavə et (mümkünsə)

## 💬 Code Style

### Bash
```bash
#!/usr/bin/env bash
set -euo pipefail   # mütləq

# Function-lar lowercase + underscore
do_something() {
  local arg="$1"
  echo "✓ $arg"
}

# Catppuccin emoji prefix (status üçün)
echo "✓ uğurlu"     # green
echo "⚠️  diqqət"    # yellow
echo "✗ xəta"       # red
```

### Python
```python
#!/usr/bin/env -S /home/blackarch/.local/venvs/vc/bin/python3
"""Docstring qısa təsvir."""
from rich.console import Console
console = Console()

def main():
    console.print("[green]✓[/green] uğurlu")

if __name__ == "__main__":
    main()
```

## 🚦 Branch Strategy

- `main` — stable release branch
- `feat/*` — yeni feature
- `fix/*` — bug fix
- `docs/*` — yalnız sənədləşdirmə
- `refactor/*` — kod təmizliği

## 🏷️ Versiya

[Semantic Versioning](https://semver.org/lang/az/):
- `MAJOR.MINOR.PATCH`
- Major (1.x.x → 2.0.0): breaking changes
- Minor (x.1.x → x.2.0): yeni feature, backwards compatible
- Patch (x.x.1 → x.x.2): bug fix

## 🤝 Code of Conduct

- Hörmətli ol
- Konstruktiv tənqid
- Yeni başlayanlara kömək et
- Cinsiyyət/irq/dil əsasında ayrı-seçkilik **yox**

## 📜 License

Töhfən MIT lisenziyası altında qəbul olunur.

## ❓ Sual?

- 💬 [GitHub Discussions](https://github.com/DarkTLord/vivaldi-cockpit/discussions)
- 🐛 [Issues](https://github.com/DarkTLord/vivaldi-cockpit/issues)
- 🐦 Twitter/X: [@DarkTLord](https://twitter.com/DarkTLord)

---

> "Tək əldən səs çıxmaz" — Azərbaycan atalar sözü 💪
