#!/bin/bash
set -e

# コマンドの返り値が非ゼロのときハンドラを実行するように指定する
trap error ERR

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

# function error() {
#   # 何か起きたことを標準エラー出力に書く
#   echo "E: Sub-process /usr/bin/dpkg returned an error code (1) occured!!!" >&2
#   echo "but Docker install OK Raspberry Pi reboot"

#   sudo reboot
#   exit 1;

#   # スクリプトを終了する
#   exit 1
# }

# # 例として非ゼロを返すコマンドを実行する
# false
