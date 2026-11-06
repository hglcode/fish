# 计算核心数（Fish 语法）
set -l np (nproc)
set -l wnp (math $np \* 2)
set -l lnp (math $np \* 3)

# ls 系列 - 使用缩写（abbr）更推荐，或保留 alias
abbr -a l 'eza -la'
abbr -a ls eza
abbr -a ll 'eza -l'
abbr -a la 'eza -lA'
abbr -a lsd 'eza -dA */'
abbr -a lsf 'eza -af'
abbr -a lsblk 'lsblk -o NAME,FSTYPE,RO,SIZE,LABEL,MOUNTPOINTS'

# 工具缩写
abbr -a a atuin
abbr -a b bash
abbr -a c clear
abbr -a cg cargo
abbr -a d "aria2c -c -V -k1M -s$lnp -x16 -j$wnp --max-tries=3 --retry-wait=5"
abbr -a du 'du -ahd1'
abbr -a df 'df -h'
abbr -a em emerge
abbr -a f fd
abbr -a fdf 'fd -F'
abbr -a g git
abbr -a h htop
abbr -a j just
abbr -a grep 'rg'
abbr -a o open
abbr -a p printf
abbr -a sdf 'sd -F'
abbr -a sdp 'sd -p'
abbr -a rgf 'rg -F'
abbr -a rgn 'rg --no-heading'
abbr -a rgnf 'rg --no-heading -F'
abbr -a s ss
abbr -a t tar
abbr -a ping 'ping -c 3'

abbr -a 7 "7z -mmt$wnp"
abbr -a 7z "7z -mmt$wnp"

# 安全删除
abbr -a rm 'trash-put'

# SSH
abbr -a laptop 'ssh laptop'

# Docker/podman 兼容
abbr -a docker podman
abbr -a docker-compose 'podman-compose'

abbr -a wf 'echo 0 | sudo -S systemctl restart hostapd.service'
abbr -a upg "echo 0 | sudo -S emerge --sync; echo 0 | sudo -S emerge --update --newuse --deep -j$wnp -l$lnp @world && echo 0 | sudo -S emerge --depclean"
abbr -a upk '/media/work/kernel/tools/update.sh'
