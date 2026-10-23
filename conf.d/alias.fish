# 计算核心数（Fish 语法）
set -l np (nproc)
set -l wnp (math $np \* 2)
set -l lnp (math $np \* 3)

# ls 系列 - 使用缩写（abbr）更推荐，或保留 alias
alias l 'eza -la'
alias ls eza
alias ll 'eza -l'
alias la 'eza -lA'
alias lsd 'eza -dA */'
alias lsf 'eza -A --sort=none'
abbr -a lsblk 'lsblk -o NAME,FSTYPE,RO,SIZE,LABEL,MOUNTPOINTS'

# 工具缩写
abbr -a c clear
abbr -a cg cargo
abbr -a du 'du -ahd1'
abbr -a df 'df -h'
abbr -a 7z "7z -mmt$wnp"
abbr -a dl "aria2c -c -V -k1M -s$lnp -x16 -j$wnp --max-tries=3 --retry-wait=5"

#abbr -a grep 'grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.venv,venv}'
abbr -a grep 'rg'
abbr -a ping 'ping -c 3'

# 安全删除
abbr -a rm 'trash-put'

# SSH
abbr -a laptop 'ssh laptop'

# Docker/podman 兼容
abbr -a docker podman
abbr -a docker-compose 'podman-compose'

# claude
#abbr -a claude 'ccr code'
#abbr -a cdc claude

abbr -a wf 'echo 0 | sudo -S systemctl restart hostapd.service'
abbr -a upg "echo 0 | sudo -S emerge --sync; echo 0 | sudo -S emerge --update --newuse --deep -j$wnp -l$lnp @world && echo 0 | sudo -S emerge --depclean"
abbr -a upk '/media/work/kernel/tools/update.sh'
