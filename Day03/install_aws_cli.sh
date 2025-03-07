#!/bin/bash
set -euo pipefail

echo "Starting AWS CLI v2 installation on Ubuntu EC2 instance..."

# Ensure the system is updated
echo "Updating package lists..."
sudo apt update -y

# Install required dependencies
echo "Installing required dependencies..."
sudo apt install -y unzip curl &> /dev/null

# Check if AWS CLI is already installed
if command -v aws &> /dev/null; then
    echo "AWS CLI is already installed: $(aws --version)"
    exit 0
fi

# Download AWS CLI v2
echo "Downloading AWS CLI v2..."
curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the installer
echo "Unzipping AWS CLI installer..."
unzip -q awscliv2.zip

# Install AWS CLI
echo "Installing AWS CLI v2..."
sudo ./aws/install

# Verify installation
if aws --version &> /dev/null; then
    echo "AWS CLI installed successfully: $(aws --version)"
else
    echo "AWS CLI installation failed" >&2
    exit 1
fi

# Clean up
echo "Cleaning up installation files..."
rm -rf awscliv2.zip ./aws

echo "AWS CLI v2 installation completed successfully!"

