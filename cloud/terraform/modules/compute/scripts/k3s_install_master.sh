#!/bin/bash

# Install common dependencies
apt-get update
apt-get install -y curl

# Install k3s master
echo "Installing k3s master on master..."

if curl -sfL https://get.k3s.io | sh -s - server \
    --node-name=master \
    --token=YNasweFZWI3CvtZoiZTGmoC6YPCCm6Zb3Hon3l1Wt5lWLzNP; then
    echo "k3s master installed successfully."
else
    echo "Failed to install k3s master."
    exit 1
fi
