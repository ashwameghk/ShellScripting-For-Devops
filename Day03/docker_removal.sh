#!/bin/bash

echo "Stopping Docker services..."
sudo systemctl stop docker
sudo systemctl stop docker.socket

echo "Removing Docker packages..."
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "Removing Docker binaries..."
sudo rm -rf /usr/bin/docker*
sudo rm -rf /usr/local/bin/docker*

echo "Removing Docker data directories..."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
sudo rm -rf /etc/docker

echo "Removing Docker group if it exists..."
sudo groupdel docker

echo "Cleaning up dependencies..."
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get update

echo "Verifying Docker removal..."
if ! command -v docker &> /dev/null; then
    echo "Docker has been successfully removed."
else
    echo "Docker is still installed. Please check manually."
fi

