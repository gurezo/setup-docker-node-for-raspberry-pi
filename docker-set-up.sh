#!/bin/bash

set -e

# curl コマンドは変数に入れて実行
# curl -fsSL https://get.docker.com -o get-docker.sh
echo "docker install  ----------------------------------"
dockerInstallCmd=`curl -fsSL https://get.docker.com -o get-docker.sh`
eval ${dockerInstallCmd}
chmod 755 get-docker.sh
sudo sh get-docker.sh
