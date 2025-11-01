#!/bin/bash

echo "apt update ----------------------------------"
sudo apt update

echo "apt upgrade ----------------------------------"
sudo apt upgrade -y

echo "apt autoremove ----------------------------------"
sudo apt autoremove -y

echo "apt autoclean ----------------------------------"
sudo apt autoclean

# Warning: apt-key output should not be parsed (stdout is not a terminal) 対策
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Dockerインストール
echo "docker install  ----------------------------------"
curl -fsSL https://get.docker.com | sudo sh

# Even if E: Sub-process / usr / bin / dpkg returned an error code (1) occurs,
# the installation is complete.
echo "if E: Sub-process /usr/bin/dpkg returned an error code (1) occured"
echo "but Docker install OK. Please logout and login again or reboot Raspberry Pi"

# user group add
echo "docker usermod  ----------------------------------"
sudo usermod -aG docker $USER

# グループ変更を適用
echo "newgrp docker  ----------------------------------"
newgrp docker

# インストール確認
echo "docker version check  ----------------------------------"
docker --version
