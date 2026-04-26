# ╔═══════════════════════════════════════════════════════════╗
# ║  vc Aliases — fish                                        ║
# ║  Avtomatik yüklənir (conf.d hər dəfə fish başlayanda)     ║
# ╚═══════════════════════════════════════════════════════════╝

# Tək hərfli alias-lar
alias v='vc'
alias va='vc ai'
alias vai='vc aiquintet'
alias vs='vc search'
alias vw='vc ws'
alias vd='vc dash'
alias vl='vc localhost'
alias vc_='vc chained'
alias vn='vc notes'
alias vk='vc kill'
alias vr='vc restart'
alias vst='vc status'
alias vb='vc backup'
alias vh='vc health'
alias vbm='vc bm find'
alias vg='vc guide'

# Welcome banner — fish üçün
if status is-interactive
  if not set -q VC_BANNER_SHOWN
    set -gx VC_BANNER_SHOWN 1
    echo ""
    echo "╭──────────────────────────────────────────────────╮"
    echo "│  🚀 vc — Vivaldi CLI hazırdır                    │"
    echo "│  v        → Menyu (Esc çıxış)                    │"
    echo "│  va  vai  vs  vw  vd  vl  vh  vk  vr  vst  vbm   │"
    echo "│  vc help → bütün komandalar                      │"
    echo "╰──────────────────────────────────────────────────╯"
    echo ""
  end
end

# Yeni əfsanə komandalar
alias vask='vc-ask'
alias vf='vc-find'
alias vcp='vc-cockpit'
alias vv='vc-voice'
# Final əfsanə komandalar
alias vweek='vc-weekly'
alias vcat='vc-categorize'
alias vshare='vc-share'
# 5 yeni truly unique
alias vsrv='vc-server start'
alias vbrief='vc-brief'
alias vsnap='vc-snap'
alias vfocus='vc-focus'
