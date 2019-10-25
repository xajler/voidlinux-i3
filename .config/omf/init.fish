function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert \cn accept-autosuggestion
    bind \cn accept-autosuggestion
    for mode in insert default visual
      bind -M $mode \ck 'history --merge ; up-or-search'
      bind -M $mode \cj 'history --merge ; down-or-search'
    end
end
set -g theme_nerd_fonts yes


set -xg LD_LIBRARY_PATH /usr/local/lib
set -xg PKG_CONFIG_PATH /usr/local/lib/pkgconfig
set -xg BROWSER firefox
set -xg GIT_EDITOR vim
set -xg PATH $HOME/go/bin $HOME/.local/bin $HOME/.scripts $HOME/.npm-global/bin $PATH
set -xg FEH_SLIDES $HOME/Pictures/wallpapers
set -xg VISUAL vim
set -xg GOPATH $HOME/go
set -xg GO111MODULE on


# wayland sway
set -xg XKB_DEFAULT_LAYOUT us
set -xg XKB_DEFAULT_VARIANT dvorak
set -xg XKB_DEFAULT_OPTIONS caps:escape,altwin:prtsc_rwin

# Locale
set -xg LC_MESSAGES C
set -xg LC_COLLATE C
set -xg LC_CTYPE en_GB.UTF-8


# GPG SSH
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK /run/user/1000/gnupg/S.gpg-agent.ssh
gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1

alias ll 'ls -alF'
alias la 'ls -alh'
alias l 'ls -CF'
alias v nvim
alias p 'sudo pacman'
alias gitpu 'git push origin'
alias pingme 'ping -c 3 ksphoto.me'
alias apps 'pacman -Qet && pacman -Qm | sort -u'
alias apps 'xbps-query -l'
alias orphans 'xbps-query -O'
alias free 'command free -m'
alias du 'du -sh'
alias df 'df -h'
# Download video link
function yt
    youtube-dl --add-metadata -ic $argv
end
# Download only audio
# youtube-dl --extract-audio --audio-format mp3
alias yta 'youtube-dl --add-metadata --extract-audio --audio-format mp3'
alias ethspeed 'speedometer -r enp6s0'
alias wifispeed 'speedometer -r wlp5s0'
alias wanip 'dig +short myip.opendns.com @resolver1.opendns.com'

# Run Polybar relaunch script
alias bars 'bash $HOME/.scripts/polybar-launch'

# Run Polybar relaunch script
alias sbars 'bash $HOME/.scripts/waybar-launch'
alias nf 'clear && neofetch'
