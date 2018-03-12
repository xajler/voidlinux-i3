# Install Void Linux


![void](void.png)

Update Void Linux

    sudo xbps-install -Syu

Install elementary software

    sudo xbps-install -S git vim
    sudo xbps-install -S bash-completion neofetch
    sudo xbps-install -S tlp powertop hardinfo htop lm_sensors fzf intel-ucode


Crete user's folders

    mkdir ~/Videos ~/Documents ~/Downloads ~/Pictures ~/Music ~/src

Create src folder and clone dotfiles

    cd ~/src
    git clone https://github.com/xajler/voidrice.git


Create /mnt/usb dir and mount to it

    sudo mkdir /mnt/usb
    sudo mount /dev/sdb1 /mnt/usb

Copy .ssh and chmod-it

    cp -rf /mnt/usb/.ssh/ ~/
    cd ~/.ssh/
    rm known_hosts 
    chmod 600 id_rsa
    chmod 644 id_rsa.pub

Copy .bash and .vim

    cp -rf src/voidrice/.bashrc src/voidrice/.vim* src/voidrice/.Xdefaults ~/

Install Vim Plugs (inside vim)

    :PlugInstall

Install sound

    sudo xbps-install -S alsa-utils alsa-plugins alsa-lib alsa-firmware 
    sudo xbps-install -S alsa-utils pulseaudio ConsoleKit2 pavucontrol
 
Install xorg 

    sudo xbps-install -S xorg-server xorg-apps xorg-minimal xinit xterm
    sudo xbps-install -S xf86-video-intel xf86-input-libinput

Install apps
 
    sudo xbps-install -S rxvt-unicode ranger qutebrowser calcurse mpd mpc mpv compton htop
    sudo xbps-install -S youtube-dl ffmpeg feh rofi arandr scrot mirage tmux urxvt-perls  
    sudo xpbs-install -S lxappearance xautolock mupdf cmatrix openvpn terminus-font ncmpcpp
    sudo xbps-install -S font-unifont-bdf font-awesome
    sudo xbps-install -S i3-gaps i3status i3lock i3blocks 
    sudo xbps-install -S acpi playerctl sysstat tree ImageMagick
    sudo xbps-install -S polybar
    sudo xbps-install -S xcalib
    sudo xbps-install -S unclutter
    sudo xbps-install -S noto-fonts-ttf 
    sudo xbps-install -S envypn-font 
    sudo xbps-install -S firefox

Copy config dotfiles from git

    # Create .config if it is note existing
    mkdir ~/.config
    cd ~/src/voidrice/
    cp -rf .ncmpcpp .xinitrc .calcurse ~/
    cd ~/src/voidrice/.config/
    cp -rf * ~/.config/

Add URxvt font resize

    cd ~/src
    git clone https://github.com/simmel/urxvt-resize-font
    sudo cp ~/src/urxvt-resize-font/resize-font /usr/lib/urxvt/perl
    
Link and start services

    la /var/service
    sudo ln -s /etc/sv/dbus /var/service
    sudo ln -s /etc/sv/tlp /var/service
    sudo ln -s /etc/sv/cgmanager /var/service
    sudo ln -s /etc/sv/consolekit /var/service
    # use mpd start in i3 config
    #sudo ln -s /etc/sv/mpd /var/service
    sudo ln -s /etc/sv/wpa_supplicant /var/service
    sudo sv status mpd
    sudo sv up mpd
    reboot # easier than up all

WiFi config (WPA)

    # enter root
    su 
    cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf 
    wpa_passphrase <SSID> <password> >> /etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf 

    # test confing
    wpa_supplicant -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant-wlp3s0.conf

    # Remove current wifi device 'wlp3s0' setup
     sudo rm /run/wpa_supplicant/wlp3s0

    # exit root
    exit

    # set up wifi and test it
    sudo ip link set wlp3s0 up
    ip addr
    ping -c 3 ksphoto.me

Multiple WiFi networks (WPA)

    # TODO

WiFi WEP notes

    # enter root
    su 
    cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant-<SSID-name>.conf 
    sudo vim /etc/wpa_supplicant/wpa_supplicant-<SSID-name>.conf
    # Add this text and change SSID and Wep key:
    network={
        ssid="MYSSID"
        key_mgmt=NONE
        wep_key0="YOUR AP WEP KEY"
        wep_tx_keyidx=0
        auth_alg=SHARED
    }

Temporary WiFi config (WPA)

    sudo sv stop wpa_supplicant
    # enter root
    su 
    cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant-<SSID-name>.conf 
    wpa_passphrase <SSID> <password> >> /etc/wpa_supplicant/wpa_supplicant-<SSID-name>.conf 

    # Run and connect
    wpa_supplicant -i wlp3s0 -c /etc/wpa_supplicant/wpa_supplicant-<SSID-name>.conf &
    

ProtonVPN 

    # Create dir for openvpn cilent
    sudo mkdir -p /etc/openvpn/client

    # Create login conf with ProtonVPN username pass
    # First line in file: proton account user
    # Second line in file: proton account pass
    sudo vim /etc/openvpn/client/login.conf

    # Make this file only readable by root
    sudo chmod 600 /etc/openvpn/client/login.conf

    # Copy all ProtonVPN .ovpn to openvpn client    
    sudo cp ~/Downloads/*.ovpn /etc/openvpn/client

Patch ProtonVPN ovpn's

    # Open ProtonVPN ovpn
    sudo vim /etc/openvpn/client/de-03.protonvpn.com.udp1194.ovpn

    # add login.conf to auth-user-pass
    auth-user-pass /etc/openvpn/client/login.conf

    # Comment two lines calling update-resolv-conf, create runit services
    #up /etc/openvpn/update-resolv-conf
    #down /etc/openvpn/update-resolv-conf

Create ProtonVPN runit services

    # TODO

Bluetooh
    
    sudo xbps-install -S bluez
    # Turn off bluetooth, use 'on' to turn it  on
    sudo bluetooth off 

Test sound with speakers and headphones

    # make sure nothing is at 0 or use pavucontrol
    alsamixer 

    # unmute muted devices
    pavucontrol 

Test urxvt font

    urxvt -fn 'xft:terminus:pixelsize=13'

Test calibration file
    # Get display name
    echo $DISPLAY

    # Test running Lenovo ThinkPad x220 
    xcalib -d :0 .config/icc/Profiles/Color-LCD-#1-2016-02-16-02-0-2.2-F-S-XYZLUT+MTX.icc

