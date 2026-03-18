status is-interactive || exit 0

# start-hyprland startplasma-wayland
[ "$(tty)" = "/dev/tty1" ] && [ -z "$DISPLAY" ] && [ "$(id -u -n)" = "l" ] && exec start-hyprland

set -U fish_greeting ''
set -U fish_prompt_pwd_dir_length 0
set -U FZF_DEFAULT_COMMAND 'fd -I --hidden --follow --exclude .git'

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
