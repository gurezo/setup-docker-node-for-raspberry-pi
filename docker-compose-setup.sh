#!/bin/bash

echo "docker-compose install  ----------------------------------"

# 最新のDocker Composeバージョンを取得
echo "最新バージョンを取得中..."
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep "tag_name" | cut -d '"' -f 4)

if [ -z "$COMPOSE_VERSION" ]; then
    echo "エラー: Docker Composeの最新バージョンを取得できませんでした"
    exit 1
fi

echo "Docker Compose ${COMPOSE_VERSION} をインストールします"

# Docker Composeのダウンロードとインストール
echo "ダウンロード中..."
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-linux-armv7l" -o /usr/local/bin/docker-compose

# 実行権限の付与
sudo chmod +x /usr/local/bin/docker-compose

# インストール確認
echo "インストール確認  ----------------------------------"
docker-compose --version

if [ $? -eq 0 ]; then
    echo "Docker Composeのインストールが完了しました"
else
    echo "エラー: Docker Composeのインストールに失敗しました"
    exit 1
fi
