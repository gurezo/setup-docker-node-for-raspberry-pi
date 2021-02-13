#!/bin/bash
set -e

# echo "docker install  ----------------------------------"
# dockerInstallCmd=`curl -sSL https://get.docker.com | sh`
# eval ${dockerInstallCmd}

echo "docker usermod  ----------------------------------"
sudo usermod -aG docker pi

echo "systemctl status docker  ----------------------------------"
# ここでグループを反映させるために再ログイン
# sudo systemctl status docker

sudo reboot

