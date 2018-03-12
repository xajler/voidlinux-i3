# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc


if [ -z "$DISPLAY" ]; then
	startx
fi
