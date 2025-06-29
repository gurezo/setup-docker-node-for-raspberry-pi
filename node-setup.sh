#!/bin/bash
set -e

# Raspberry Pi OS 2025-05-13 (armhf/arm64) 用 Node.js セットアップスクリプト
# Node.js LTS (v22) をインストール
# 参考: https://github.com/nodesource/distributions

echo "=== Node.js Setup for Raspberry Pi OS 2025-05-13 ==="

echo "1. Updating package lists..."
sudo apt-get -y update

echo "2. Upgrading packages..."
sudo apt-get -y upgrade

echo "3. Removing unnecessary packages..."
sudo apt-get -y autoremove

echo "4. Cleaning package cache..."
sudo apt-get -y autoclean

echo "5. Installing required packages..."
sudo apt-get -y install curl ca-certificates gnupg

echo "6. Setting up NodeSource repository for Node.js 22.x (LTS)..."
# NodeSource GPG key の追加
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg

# NodeSource repository の追加
echo "deb [signed-by=/usr/share/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/nodesource.list

echo "7. Updating package lists with NodeSource repository..."
sudo apt-get -y update

echo "8. Installing Node.js and npm..."
sudo apt-get -y install nodejs

echo "9. Updating npm to latest version..."
sudo npm install -g npm@latest

echo "10. Verifying installation..."
echo "Node.js version:"
node --version
echo "npm version:"
npm --version

echo "=== Node.js Setup Complete ==="
echo "Node.js and npm have been successfully installed!"
echo ""
echo "Usage examples:"
echo "  node --version"
echo "  npm --version"
echo "  npm init -y"
echo "  npm install package-name"
