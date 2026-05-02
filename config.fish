status is-interactive || exit 0

# start-hyprland startplasma-wayland
[ "$(tty)" = "/dev/tty1" ] && [ -z "$DISPLAY" ] && [ "$(id -u -n)" = "l" ] && exec start-hyprland

set -U fish_greeting ''
set -U fish_prompt_pwd_dir_length 0
#set -x FZF_DEFAULT_COMMAND 'fd -I --hidden --follow --exclude .git'
