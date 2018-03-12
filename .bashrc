stty -ixon

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

#Generic shortcuts:
alias music="ncmpcpp"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias email="mutt"
alias files="ranger"
alias chat="weechat"
alias audio="ncpamixer"
alias calender="calcurse"

#Some aliases
alias v="vim"
alias ka="killall"
alias sv="sudo vim"
alias r="ranger"
alias ls='ls -hN --color=auto --group-directories-first'
alias g="git"
alias gitup="git push origin master"
alias mkdir="mkdir -pv"
alias crep="grep --color=always"
alias p="sudo pacman"
alias sdn="sudo shutdown now"
alias yt="youtube-dl -ic"
alias yta="youtube-dl -xic"
alias nf="clear && neofetch"
alias newnet="sudo systemctl restart NetworkManager"
alias tuctime="sudo timedatectl set-timezone Europe/Zagreb && i3 restart"
alias youtube="youtube-viewer"
alias YT="youtube-viewer"
alias syt="youtube-viewer"
alias TC='texclear'
alias ethspeed="speedometer -r enp0s25"
alias wifispeed="speedometer -r wlp2s0"
alias bars="bash ~/.config/polybar/launch.sh"
alias lsc="screen.sh l"
alias vsc="screen.sh v"
alias dsc="screen.sh d"
alias bw="wal -i ~/.config/wall.png"
alias ir="i3-msg restart"

#Music
alias pause="mpc toggle"
alias next="mpc next"
alias prev="mpc prev"
alias trupause="mpc pause"
alias beg="mpc seek 0%"
alias lilbak="mpc seek -10"
alias lilfor="mpc seek +10"
alias bigbak="mpc seek -120"
alias bigfor="mpc seek +120"


#My own stuff, feel free to delete.
alias sup="webupdate"
alias sync-movies="rsync -avr --rsh='ssh -p443' /home/Shared/Videos/Movies/ $DESKIP:/home/Shared/Videos/Movies"
alias sync-tv="rsync -avr --rsh='ssh -p443' /home/Shared/Videos/Television/ $DESKIP:/home/Shared/Videos/Television"
alias pingme="ping ksphoto.me"

#Check the weather:
weath() { curl wttr.in/$1 ;}
#Install an AUR package manually (for Parabola to get AUR access):
aurinstall() { curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz && tar -xvf $1.tar.gz && cd $1 && makepkg --noconfirm -si && cd .. && rm -rf $1 $1.tar.gz ;}
desksync() { rsync -avr --rsh='ssh -p443' $(realpath $1)/ $DESKIP:$(realpath $1);}
deskget() { rsync -avr --rsh='ssh -p443' $DESKIP:$(realpath $1) $(realpath $1)/;}
vrs() { rsync $(realpath $1) $(realpath $1 | sed 's/\/luke\//\/luke\/Repos\/voidrice\//g');}
bl() { convert $@ -resize 1440x1080\> bl_$@ ;}
CF() { cd ~/.config/$1 && ls ;}

#Directory Shortcuts:
alias h="cd ~ && ls -a"
alias d="cd ~/Documents && ls -a"
alias D="cd ~/Downloads && ls -a"
alias p="cd ~/Pictures && ls -a"
alias m="cd ~/Music && ls -a"
alias r="cd / && ls -a"
alias cf="cd ~/.config && ls -a"
alias cfr="vim ~/.config/ranger/rc.conf.base"
alias cfi="vim ~/.config/i3/config"
alias cfq="vim ~/.config/qutebrowser/keys.conf.base"
alias cfQ="vim ~/.config/qutebrowser/qutebrowser.conf"
alias cfM="vim ~/.config/moc/keymap"
alias cfp="vim ~/.config/polybar/config"
alias cfd="vim ~/.Xdefaults"
alias dv="setxkbmap dvorak"
alias la="ls -al"
alias fake="mono /home/x/src/qualtrak/Fake/tools/FAKE.exe"


export PATH=~/.bin:~/.npm-global/bin:$PATH
set -o vi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
