#!/bin/bash

# Raspberry Pi OS 2025-05-13 (armhf/arm64) 用 Docker セットアップスクリプト
# 参考: https://docs.docker.com/engine/install/raspberry-pi-os/

echo "=== Docker Setup for Raspberry Pi OS 2025-05-13 ==="

echo "1. Updating package lists..."
sudo apt-get -y update

echo "2. Upgrading packages..."
sudo apt-get -y upgrade

echo "3. Removing unnecessary packages..."
sudo apt-get -y autoremove

echo "4. Cleaning package cache..."
sudo apt-get -y autoclean

echo "5. Installing required packages..."
sudo apt-get -y install ca-certificates curl gnupg lsb-release

echo "6. Creating keyrings directory..."
sudo install -m 0755 -d /etc/apt/keyrings

echo "7. Adding Docker's official GPG key..."
sudo curl -fsSL https://download.docker.com/linux/raspbian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "8. Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/raspbian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "9. Updating package lists with Docker repository..."
sudo apt-get -y update

echo "10. Installing Docker packages..."
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "11. Starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "12. Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "=== Docker Setup Complete ==="
echo "Note: You need to log out and log back in for the docker group changes to take effect."
echo "Or run: newgrp docker"
echo ""
echo "To verify installation, run:"
echo "  docker --version"
echo "  docker run hello-world"
