#!/bin/bash

echo "Stopping Nginx service..."
sudo systemctl stop nginx
sudo systemctl disable nginx

echo "Removing Nginx packages..."
sudo apt-get purge -y nginx nginx-common nginx-full nginx-core

echo "Removing Nginx configuration and logs..."
sudo rm -rf /etc/nginx
sudo rm -rf /var/log/nginx
sudo rm -rf /var/lib/nginx
sudo rm -rf /usr/share/nginx

echo "Cleaning up dependencies..."
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get update

echo "Verifying Nginx removal..."
if ! command -v nginx &> /dev/null; then
    echo "Nginx has been successfully removed."
else
    echo "Nginx is still installed. Please check manually."
fi

