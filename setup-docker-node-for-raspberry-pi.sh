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

# # curlコマンドがbashのシェルスクリプトを介して実行されない
# # https://is.gd/bSlbfa
# # curl コマンドは変数に入れて実行
# # curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# # https://github.com/nodesource/distributions 参照
# echo "npm, node install  ----------------------------------"
# nodeVer=14
# nodeInstallCmd=`curl -sL https://deb.nodesource.com/setup_${nodeVer}.x | sudo -E bash -`
# eval ${nodeInstallCmd}
# sudo apt install nodejs -y
# sudo npm install -g npm

# curl コマンドは変数に入れて実行
# curl -fsSL https://get.docker.com -o get-docker.sh
echo "docker install  ----------------------------------"
dockerInstallCmd=`curl -fsSL https://get.docker.com -o get-docker.sh`
eval ${dockerInstallCmd}
chmod 755 get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker `pi`
sudo reboot

echo "docker boot  ----------------------------------"
# ここでグループを反映させるために再ログイン
sudo systemctl status docker

# docker-compose インストール用にセットアップ
echo "python3-pip install  ----------------------------------"
sudo apt -y install python3-pip


# bffi-devをインストールした後ならpip3でdocker-composeをインストールできる
echo "docker-compose  ----------------------------------"
pip3 install --upgrade pip
sudo pip3 install -U docker-compose







