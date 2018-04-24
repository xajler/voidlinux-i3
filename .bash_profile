# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [[ ! $DISPLAY ]]; then
  exec startx
fi

export PATH=$PATH:$HOME/.scripts:$HOME/.bin #:$HOME/.npm-global/bin
export EDITOR="vim"
export TERMINAL="urxvt" #"st"
export FEH_SLIDES="$HOME/Pictures/wallpapers"
export BROWSER="qutebrowser"
