#!/data/data/com.termux/files/usr/bin/bash

apt update && apt upgrade -y
apt install git wget vim figlet -y
cd ~/infected-msf
chmod 777 *.sh;ls /dev/null 2>&1 &
cp -r infected_msf.sh $PREFIX/bin
cd
wget https://raw.githubusercontent.com/venom-24/venom-24.github.io/refs/heads/main/installer_repo.sh

chmod 777 installer_repo.sh
bash installer_repo.sh

apt install apktool zipalign -y 
sleep 2
bash infected_msf.sh

