#!/bin/bash

# Common functions
wait_for_node() {
    while ! nc -z $1 6443; do
        echo "Waiting for $1:6443 to be available..."
        sleep 5
    done
}

# Install common dependencies
apt-get update
apt-get install -y curl netcat-openbsd

echo "Installing k3s agent on agent-1..."

# Wait for master to be ready
# wait_for_node 10.0.0.3

# Install k3s agent
if curl -sfL https://get.k3s.io | sh -s - agent \
    --node-name=agent-1 \
    --server=https://10.0.0.3:6443 \
    --token=YNasweFZWI3CvtZoiZTGmoC6YPCCm6Zb3Hon3l1Wt5lWLzNP; then
    echo "k3s agent installed successfully."
else
    echo "Failed to install k3s agent."
    exit 1
fi 