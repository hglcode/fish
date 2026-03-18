# 计算核心数（Fish 语法）
set -l np (nproc)
set -l wnp (math $np \* 2)
set -l lnp (math $np \* 3)

# ls 系列 - 使用缩写（abbr）更推荐，或保留 alias
abbr -a ls 'ls --color=auto'
abbr -a ll 'ls -lh'
abbr -a la 'ls -lAh'
abbr -a l 'ls -lah'
abbr -a lsd 'ls -Ad */'
abbr -a lsf 'ls -fA'
abbr -a lsblk 'lsblk -o NAME,FSTYPE,RO,SIZE,LABEL,MOUNTPOINTS'

# 工具缩写
abbr -a cls clear
abbr -a du 'du -ahd1'
abbr -a df 'df -h'
abbr -a 7z "7z -mmt$wnp"
abbr -a dl "aria2c -c -V -k1M -s$lnp -x16 -j$wnp --max-tries=3 --retry-wait=5"

#abbr -a grep 'grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.venv,venv}'
abbr -a grep 'grep --exclude-dir={.git}'
abbr -a ping 'ping -c 3'

# 安全删除
abbr -a rm 'trash-put'

# SSH
abbr -a laptop 'ssh laptop'

# Docker/podman 兼容
abbr -a docker 'podman'
abbr -a docker-compose 'docker compose'

abbr -a wifi 'echo 0 | sudo -S systemctl restart hostapd.service'
abbr -a upgrade "echo 0 | sudo -S emerge --sync; echo 0 | sudo -S emerge --update --newuse --deep -j$wnp -l$lnp @world; echo 0 | sudo -S emerge --depclean"
