#!/bin/bash

# Raspberry Pi OS 2025-05-13 (armhf/arm64) 用 Docker Compose セットアップスクリプト
# Docker Compose V2 (Docker Compose Plugin) を使用
# 参考: https://docs.docker.com/compose/install/

echo "=== Docker Compose Setup for Raspberry Pi OS 2025-05-13 ==="

echo "1. Checking if Docker is installed..."
if ! command -v docker &> /dev/null; then
    echo "Error: Docker is not installed. Please run docker-setup.sh first."
    exit 1
fi

echo "2. Checking if Docker Compose Plugin is already installed..."
if docker compose version &> /dev/null; then
    echo "Docker Compose Plugin is already installed."
    docker compose version
    exit 0
fi

echo "3. Installing Docker Compose Plugin..."
# Docker Compose Plugin は docker-setup.sh で既にインストールされているはず
# 念のため再インストールを試行
sudo apt-get -y update
sudo apt-get -y install docker-compose-plugin

echo "4. Verifying Docker Compose installation..."
if docker compose version &> /dev/null; then
    echo "=== Docker Compose Setup Complete ==="
    echo "Docker Compose Plugin installed successfully!"
    docker compose version
    echo ""
    echo "Usage examples:"
    echo "  docker compose up -d"
    echo "  docker compose down"
    echo "  docker compose ps"
else
    echo "Error: Docker Compose Plugin installation failed."
    echo "Please check if Docker is properly installed and try again."
    exit 1
fi
