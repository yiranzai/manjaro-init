#!/bin/bash

sudo pacman-mirrors -i -c China -m rank
sudo echo '[archlinuxcn]
# SigLevel = Optional TrustedOnly
SigLevel = Never
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
sudo pacman-mirrors -g
sudo pacman -Syy
sudo pacman -S archlinux-keying
sudo pacman -Syyu 
sudo systemctl enable bumblebeed.service

### packages
sudo pacman -S yaourt git google-chrome dos2unix synapse variety vim tree net-tools zsh  yay fcitx-im fcitx-configtool fcitx-sogoupinyin fcitx-googlepinyin nutstore uget neofetch htop wqy-microhei wqy-zenhei ttf-wps-fonts adobe-source-code-pro-fonts adobe-source-sans-pro-fonts	adobe-source-serif-pro-fonts adobe-source-han-sans-cn-fonts	adobe-source-han-serif-cn-fonts	deepin-screenshot xmind nemo nemo-fileroller netease-cloud-music redshift peek jetbrains-toolbox dbeaver npm visual-studio-code-bin openssh firefox firefox-i18n-zh-cn numix-circle-icon-theme papirus-icon-theme gtk-theme-arc-git konsole debtap vlc galculator

### sublime
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text

### node
sudo npm install n
sudo n 8

echo 'export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"' >> ~/.xprofile