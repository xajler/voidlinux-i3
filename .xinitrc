# I think disables a bell?
xset b off
systemctl --user import-environment DISPLAY

#### Keyboar and remapping

# Map the caps lock key to super...
setxkbmap -layout dvorak -option caps:super
# If you don't want a us international keyboard, rather whatever keyboard
# you set in your installation, comment out the above line and uncomment
# the one below.
#setxkbmap -option caps:super

# But when it is pressed only once, treat it as escape.
xcape -e 'Super_L=Escape'

# Remap Lenovo keys in older laptos Menu button to Meta in newer Print button to Super

# Remap Menu button to Super (for ThinkPad x220):
#xmodmap -e 'keycode 135 = Super_L'

# Remap PrtSc button to Super (for ThinkPad t440s - for all thinkpads starting with x230, t430 and newer, all having Print key):
xmodmap -e 'keycode 107 = Super_L'

#### Monitor Calibration

# calibration for ThinkPad t440s (Try before, -d display might be different number)
/usr/bin/xcalib -d :0 $HOME/.config/icc/B140HAN01_2_Easy_D65_201801151337.icm
# calibration for ThinkPad x220 (Try before, -d display might be different number)
#/usr/bin/xcalib -d :0 $HOME/.config/icc/Color-LCD-#1-2016-02-16-02-0-2.2-F-S-XYZLUT+MTX.icc

#### Start some apps

# Setting the background:
#feh --bg-scale ~/.config/wall.png & disown

# Starts dunst for notifications:
#dunst & disown

# Music player daemon:
#mpd & disown

# Composite manager:
#compton --xrender-sync-fence & disown

# Unclutter makes the mouse invisible after a brief period
#unclutter & disown

# Lock window
#xautolock -time 10 -locker $HOME/.scripts/blurlock & disown

# Cycle desktop wallpapers from given #FEH_SLIDES folder
#$HOME/.scripts/feh-slides -i 10 "$FEH_SLIDES" & disown

# Start transmission daemon
# transmission-daemon & disown

# Turn off Bluetoot by default
#sudo bluetooth off


### Gnome keyring

dbus-update-activation-environment --systemd DISPLAY &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

#### i3

# comment out for running sway
exec i3
