#!/data/data/com.termux/files/usr/bin/bash

apt update && apt upgrade -y
apt install git wget vim -y

wget https://raw.githubusercontent.com/venom-24/venom-24.github.io/refs/heads/main/installer_repo.sh

chmod 777 installer_repo.sh
bash installer_repo.sh

apt install apktool zipalign -y 

