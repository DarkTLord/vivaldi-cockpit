# ╔═══════════════════════════════════════════════════════════╗
# ║  vc Aliases — bash/zsh                                    ║
# ║  Source-luq: source ~/.config/vc-aliases.sh               ║
# ╚═══════════════════════════════════════════════════════════╝

# Tək hərfli super-short
alias v='vc'              # Menyu (interaktiv)
alias va='vc ai'          # AI Triple
alias vai='vc aiquintet'  # 5 AI birdən
alias vs='vc search'      # Axtarış
alias vw='vc ws'          # Workspace
alias vd='vc dash'        # Dashboard
alias vl='vc localhost'   # Localhost
alias vc_='vc chained'    # Chained
alias vn='vc notes'       # Notes
alias vk='vc kill'        # Vivaldi öldür
alias vr='vc restart'     # Restart
alias vst='vc status'     # Status
alias vb='vc backup'      # Backup
alias vh='vc health'      # Health check
alias vbm='vc bm find'    # Bookmark axtar
alias vg='vc guide'       # Guide aç

# Welcome banner — terminal açıldıqda göstər (yalnız interaktiv shell-də)
if [[ $- == *i* ]] && [[ -z "$VC_BANNER_SHOWN" ]]; then
  export VC_BANNER_SHOWN=1
  cat << 'BANNER'

╭──────────────────────────────────────────────────╮
│  🚀 vc — Vivaldi CLI hazırdır                    │
│  v        → Menyu (Esc çıxış)                    │
│  va  vai  vs  vw  vd  vl  vh  vk  vr  vst  vbm   │
│  vc help → bütün komandalar                      │
╰──────────────────────────────────────────────────╯

BANNER
fi

# Yeni əfsanə komandalar (5)
alias vask='vc-ask'         # AI sorğu
alias vf='vc-find'           # Universal axtarış
alias vcp='vc-cockpit'       # Cockpit monitor
alias vv='vc-voice'          # Voice control

# Final əfsanə komandalar
alias vweek='vc-weekly'           # Həftəlik raport
alias vcat='vc-categorize'        # AI bookmark kateqoriya
alias vshare='vc-share'           # GitHub paylaş

# 5 yeni truly unique
alias vsrv='vc-server start'      # Web dashboard server
alias vbrief='vc-brief'           # AI daily briefing
alias vsnap='vc-snap'             # Workspace snapshot
alias vfocus='vc-focus'           # Pomodoro focus
