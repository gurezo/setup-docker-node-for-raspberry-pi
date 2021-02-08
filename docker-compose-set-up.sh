#!/bin/bash

set -e

# bffi-devをインストールした後ならpip3でdocker-composeをインストールできる
echo "docker-compose  ----------------------------------"
sudo pip3 install docker-compose
