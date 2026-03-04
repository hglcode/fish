status is-interactive || exit 0

# start-hyprland startplasma-wayland
[ "$(tty)" = "/dev/tty1" ] && [ -z "$DISPLAY" ] && [ "$(id -u -n)" = "l" ] && exec start-hyprland && exit 0

set -U fish_greeting ''
set -U fish_prompt_pwd_dir_length 0
