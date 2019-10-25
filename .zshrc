# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export FZF_BASE=/usr/bin/fzf

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sorin"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    archlinux
    # autojump
    bgnotify
    # codeclimate
    colored-man-pages
    colorize
    command-not-found
    # copybuffer
    dirpersist
    docker-compose
    docker-machine
    docker
    dotenv
    fancy-ctrl-z
    fasd
    fd
    fzf
    git-prompt
    git
    globalias
    golang
    gpg-agent
    history
    httpie
    rsync
    systemadmin
    systemd
    vscode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
export LD_LIBRARY_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export BROWSER="firefox"
export GIT_EDITOR=vim
export PATH=$HOME/go/bin:$HOME/.local/bin:$HOME/.scripts:$HOME/.npm-global/bin:$PATH
export FEH_SLIDES=$HOME/Pictures/wallpapers
export VISUAL="vim"
export GOPATH=$HOME/go
export GO111MODULE=on


# wayland sway
export XKB_DEFAULT_LAYOUT=us
export XKB_DEFAULT_VARIANT=dvorak
export XKB_DEFAULT_OPTIONS=caps:escape
#,altwin:prtsc_rwin

# Locale
export LC_MESSAGES=C
export LC_COLLATE=C
export LC_CTYPE=en_GB.UTF-8

# GPG SSH
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
gpg-connect-agent updatestartuptty /bye

alias ll='ls -alF'
alias la='ls -alh'
alias l='ls -CF'
alias v='nvim'
alias xi="sudo xbps-install"
alias gitpu="git push origin"
alias newsboat='newsboat -C ~/.config/newsboat/config -u ~/.config/newsboat/urls'
alias pingme="ping -c 3 ksphoto.me"
alias progs="xbps-query -l"  # List programs I've installed
alias orphans="xbps-query -O" # List orphan programs
alias appsByDate="expac --timefmt='%F %T' '%l %n' | sort -n"
alias free="free -m"
alias du="du -sh"
alias df="df -h"
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata --extract-audio --audio-format mp3" # Download only audio
#youtube-dl --extract-audio --audio-format mp3
alias ethspeed="speedometer -r enp6s0"
alias wifispeed="speedometer -r wlp5s0"
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias bars="bash $HOME/.scripts/polybar-launch" # Run Polybar relaunch script
alias sbars="bash $HOME/.scripts/waybar-launch" # Run Polybar relaunch script
alias nf='clear && neofetch'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias mnterncryptedusb="sudo cryptsetup luksOpen /dev/sdb1 vault && sudo mount /dev/mapper/vault /mnt/usb"
alias umntencryptedusb="sudo umount /mnt/usb && sudo cryptsetup luksClose vault"

