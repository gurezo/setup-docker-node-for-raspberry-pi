#!/bin/bash
set -e

echo "apt-get -y update ----------------------------------"
sudo apt-get -y update

echo "apt-get -y upgrade ----------------------------------"
sudo apt-get -y upgrade

echo "apt-get -y autoremove ----------------------------------"
sudo apt-get -y autoremove

echo "apt-get -y autoclean ----------------------------------"
sudo apt-get -y autoclean

# Warning: apt-key output should not be parsed (stdout is not a terminal) 対策
export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# curl コマンドは変数に入れて実行
# curl -fsSL https://get.docker.com -o get-docker.sh
echo "docker install  ----------------------------------"
dockerInstallCmd=`curl -sSL https://get.docker.com | sh`
eval ${dockerInstallCmd}
sudo reboot
