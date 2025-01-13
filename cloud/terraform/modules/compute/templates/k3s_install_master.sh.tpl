#!/bin/bash

# Install common dependencies
apt-get update
apt-get install -y curl

# Install k3s master
echo "Installing k3s master on ${node_name}..."

if curl -sfL https://get.k3s.io | sh -s - server \
    --node-name=${node_name} \
    --token=${k3s_token}; then
    echo "k3s master installed successfully."
else
    echo "Failed to install k3s master."
    exit 1
fi
