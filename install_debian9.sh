echo -e "\033[32m[+] Installing KDE Desktop Minimal\033[0m"
apt-get install -y kde-plasma-desktop 
apt-get install -y sudo

echo -e "\033[32m[+] Installing Wifi Driver \033[0m"
apt-get install -y firmware-iwlwifi

echo -e "\033[32m[+] Installing Application - Development\033[0m"
apt-get install -y git zsh gitg qterminal 
apt-get install -y htop lshw
apt-get install -y binutils gdb ctags ccache cscope kate cmake
apt-get install -y zeal pandoc xournal

echo -e "\033[32m[+] Installing Application - i3wm\033[0m"
apt-get install -y i3 i3status i3lock feh alsa-utils xbacklight xcompmgr pcmanfm

echo -e "\033[32m[+] Installing Application - Internet\033[0m"
apt-get install -y curl axel aria2 amule
apt-get install -y thunderbird

echo -e "\033[32m[+] Installing Application - Multimedia\033[0m"
apt-get install -y gimp gwenview 
apt-get install -y audacity audacious vlc
apt-get install -y okular

echo -e "\033[32m[+] Installing Application - Utilities\033[0m"
apt-get install -y xournal kate shutter

echo -e "\033[32m[+] Installing Application - Nvidia Driver\033[0m"
apt-get install -y nvidia-driver nvidia-xconfig nvidia-settings


echo -e "\033[32m[+] Installing Application - Input Method\033[0m"
apt-get install -y fcitx fcitx-googlepinyin

apt-get install -y python3-pip
source ~/.bashrc
pip3 install shadowsocks 
cat > /etc/shadowsocks.json <<EOF
{
        "server":"103.73.67.173",
        "server_port":10000,
        "local_address":"127.0.0.1",
        "local_port":1080,
        "password":"password!@#",
        "timeout":600,
        "method":"aes-256-cfb"
}
EOF




# Enable USB in virutal machine
#usermod -a -G vboxusers kristoffer
