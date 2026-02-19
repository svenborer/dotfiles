#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=vim
export PAGER=less
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GRIMSHOT_FILENAME_FORMAT="$(date +%Y%m%d%H%M%S%N)"
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_SCREENSHOTS_DIR="$HOME/screenshots"
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export MOZ_ENABLE_WAYLAND=1
export PATH=$PATH:"$HOME/.local/bin"
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

