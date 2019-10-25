stty -ixon
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 9)\][\[$(tput setaf 11)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 12)\]\h \[$(tput setaf 13)\]\W\[$(tput setaf 9)\]]\[$(tput setaf 15)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 9)\][\[$(tput setaf 11)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 12)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 13)\]\W\[$(tput setaf 9)\]]\[$(tput setaf 15)\]\\$ \[$(tput sgr0)\]"
fi

# GPG SSH
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
gpg-connect-agent updatestartuptty /bye

#Generic shortcuts:
alias music="ncmpcpp"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias email="mutt"
alias files="ranger"
alias chat="weechat"
alias audio="ncpamixer"
alias calender="calcurse"

# Audio and Music
alias mute="pamixer -m"
alias unmute="pamixer -u"
alias vu="pamixer --allow-boost -i 5"
alias vd="pamixer --allow-boost -d 5"
alias pause="mpc toggle"
alias next="mpc next"
alias prev="mpc prev"
alias trupause="mpc pause"
alias beg="mpc seek 0%"
alias lilbak="mpc seek -10"
alias lilfor="mpc seek +10"
alias bigbak="mpc seek -120"
alias bigfor="mpc seek +120"

# System Maintainence
alias hrtime="sudo timedatectl set-timezone Europe/Zagreb && i3 restart"
alias mw="~/.config/mutt/mutt-wizard.sh"
alias muttwizard="~/.config/mutt/mutt-wizard.sh"
alias progs="xbps-query -l"  # List programs I've installed
alias orphans="xbps-query -O" # List orphan programs
alias sdn="sudo shutdown now"
alias newnet="sudo sv restart wpa_supplicant" # Refresh wifi
alias vpnrestart="sudo sv restart de-03-vpn"
alias nf="clear && neofetch" # Le Redditfetch
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg
alias btoff="sudo bluetooth off"
alias bton="sudo bluetooth on"

#Directory Shortcuts:
alias la="ls -al"
alias h="cd ~ && ls -a"
alias d="cd ~/Documents && ls -a"
alias D="cd ~/Downloads && ls -a"
alias p="cd ~/Pictures && ls -a"
alias m="cd ~/Music && ls -a"
alias r="cd / && ls -a"
alias cf="cd ~/.config && ls -a"
alias vim="nvim"
alias cfr="vim ~/.config/ranger/rc.conf.base"
alias cfi="vim ~/.config/i3/config"
alias cfq="vim ~/.config/qutebrowser/config.py"
alias cfM="vim ~/.config/moc/keymap"
alias cfp="vim ~/.config/polybar/config"
alias cfd="vim ~/.Xdefaults"
alias gtmu="cd /mnt/usb;ls -al"


# Some aliases
alias xi="sudo xbps-install"
alias v="vim"
alias svi="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias gitup="git push origin master"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias rf="source ~/.bashrc"
alias ref="shortcuts.sh && source ~/.bashrc" # Refresh shortcuts manually and reload bashrc
alias bars="bash ~/.scripts/polybar-launch" # Run Polybar relaunch script

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias crep="grep --color=always" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=xterm256" #Color cat - print file with syntax highlighting.

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias ethspeed="speedometer -r enp0s25"
alias wifispeed="speedometer -r wlp3s0"
alias tpbs="clear && figlet -c TPB Search && tpb.sh" # Pirate Bay search
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

# Misc
#alias fake="mono /home/x/src/qualtrak/Fake/tools/FAKE.exe"
alias hfspmnt="sudo mount -t hfsplus /dev/sdb2 /mnt/usb"
alias i3tree="i3-msg -t get_tree"
alias gpg="gpg2"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/x/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/x/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/x/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/x/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
