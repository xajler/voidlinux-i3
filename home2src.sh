#!/bin/sh

SRC_PATH="$HOME/src/voidlinux-i3"
DOT_FILES=(".bash_profile" ".bashrc" \
	".exports" ".inputrc" ".tmux.conf" ".urlview" ".Xdefaults" ".xinitrc")
DOT_DIRS=(".icons" ".scripts" ".themes")
CONFIG_FILES=("compton.conf" "user-dirs.dirs" "wall.png")
CONFIG_DIRS=("dunst" "feh" "gtk-2.0" "gtk-3.0" "htop" "i3" "icc" \
	"mpv" "neofetch" "startpage")

doUpdate() {
	# Root dot files
	echo "Updating root dotfiles..."
	for item in "${DOT_FILES[@]}" ; do
		echo -e "\t$item"
		[[ -f "$HOME/$item" ]] && cp "$HOME/$item" "$SRC_PATH"
	done

	echo "Updating root dot dirs..."
	for item in "${DOT_DIRS[@]}" ; do
		echo -e "\t$item"
		[[ ! -d "$SRC_PATH/$item" ]] && mkdir -p "$SRC_PATH/$item"
		if [[ ! -d "$HOME/$item" ]]; then
			echo "$HOME/$item not fonud"; exit 0
		else
			cp -rf "$HOME/$item" "$SRC_PATH"
		fi
	done

	#### .config
	if [[ ! -d "$SRC_PATH/.config" ]]; then
		mkdir -p "$SRC_PATH/.config"
	fi

	echo "Updating .config root files..."
	for item in "${CONFIG_FILES[@]}" ; do
		echo -e "\t$item"
		[[ -f "$HOME/.config/$item" ]] && cp "$HOME/.config/$item" "$SRC_PATH/.config"
	done

	echo "Updating .config dirs..."
	for item in "${CONFIG_DIRS[@]}" ; do
		echo -e "\t$item"
		[[ ! -d "$SRC_PATH/.config/$item" ]] && mkdir -p "$SRC_PATH/.config/$item"
		if [[ ! -d "$HOME/.config/$item" ]]; then
			echo "$HOME/.config/$item not fonud"; exit 0
		else
			cp -rf "$HOME/.config/$item" "$SRC_PATH/.config"
		fi
	done

	#### Other .config dirs
	echo "Updating other .config dirs..."

	# .	# mpd
	echo -e "\tmpd"
	[[ ! -d "$SRC_PATH/.config/mpd" ]] && mkdir -p "$SRC_PATH/.config/mpd"
	if [[ ! -d "$HOME/.config/mpd" ]]; then
		echo "$HOME/.config/mpd not fonud"; exit 0
	else
		cp "$HOME/.config/mpd/mpd.conf" "$SRC_PATH/.config/mpd"
	fi

	# ncmpcpp
	echo -e "\tncmpcpp"
	[[ ! -d "$SRC_PATH/.config/ncmpcpp" ]] && mkdir -p "$SRC_PATH/.config/ncmpcpp"
	if [[ ! -d "$HOME/.config/ncmpcpp" ]]; then
		echo "$HOME/.config/ncmpcpp not fonud"; exit 0
	else
		cp -rf "$HOME/.config/ncmpcpp/bindings" "$HOME/.config/ncmpcpp/config" \
			"$SRC_PATH/.config/ncmpcpp"
	fi

	# newsboat
	echo -e "\tnewsboat"
	[[ ! -d "$SRC_PATH/.config/newsboat" ]] && mkdir -p "$SRC_PATH/.config/newsboat"
	if [[ ! -d "$HOME/.config/newsboat" ]]; then
		echo "$HOME/.config/newsboat not fonud"; exit 0
	else
		cp "$HOME/.config/newsboat/config" "$SRC_PATH/.config/newsboat"
	fi

	# nvim
	echo -e "\tnvim"
	[[ ! -d "$SRC_PATH/.config/nvim" ]] && mkdir -p "$SRC_PATH/.config/nvim"
	if [[ ! -d "$HOME/.config/nvim" ]]; then
		echo "$HOME/.config/nvim not fonud"; exit 0
	else
		cp -rf "$HOME/.config/nvim/autoload" "$HOME/.config/nvim/syntax" \
			"$HOME/.config/nvim/init.vim" "$SRC_PATH/.config/nvim"
	fi

	# qutebrowser
	echo -e "\tqutebrowser"
	[[ ! -d "$SRC_PATH/.config/qutebrowser" ]] && mkdir -p "$SRC_PATH/.config/qutebrowser"
	if [[ ! -d "$HOME/.config/qutebrowser" ]]; then
		echo "$HOME/.config/qutebrowser not fonud"; exit 0
	else
		cp "$HOME/.config/qutebrowser/config.py" "$SRC_PATH/.config/qutebrowser"
	fi

	# ranger
	echo -e "\tranger"
	[[ ! -d "$SRC_PATH/.config/ranger" ]] && mkdir -p "$SRC_PATH/.config/ranger"
	if [[ ! -d "$HOME/.config/ranger" ]]; then
		echo "$HOME/.config/ranger not fonud"; exit 0
	else
		cp "$HOME/.config/ranger/commands.py" "$HOME/.config/ranger/rc.conf" \
			"$HOME/.config/ranger/rifle.conf" "$HOME/.config/ranger/scope.sh" \
			 "$SRC_PATH/.config/ranger"
	fi
}

read -r -p "Are you sure you want to overwrite src with dotfiles from home? [y/N] " response
response=${response,,}    # tolower
if [[ "$response" =~ ^(yes|y)$ ]]; then
	doUpdate;
else
	exit 0;
fi
