# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

export PATH=$PATH:$HOME/.scripts:$HOME/.bin #:$HOME/.npm-global/bin
export EDITOR="vim"
export TERMINAL="st" #"urxvt"
export FEH_SLIDES="$HOME/Pictures/wallpapers"
export BROWSER="qutebrowser"

if [[ ! $DISPLAY ]]; then
  exec startx
fi
