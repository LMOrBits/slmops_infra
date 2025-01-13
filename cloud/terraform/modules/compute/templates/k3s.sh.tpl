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

# Determine if master or agent
if [[ "${node_type}" == "master" ]]; then
    echo "Installing k3s master on ${node_name}..."

    # Install k3s master
    if curl -sfL https://get.k3s.io | sh -s - server \
        --node-name=${node_name} \
        --token=${k3s_token}; then
        echo "k3s master installed successfully."
    else
        echo "Failed to install k3s master."
        exit 1
    fi

    # Get node token for agents
    echo "Waiting for node token to be available..."
    until [ -f /var/lib/rancher/k3s/server/node-token ]; do
        sleep 2
    done
    echo "Node token is available."

else
    echo "Installing k3s agent on ${node_name}..."
    
    # Wait for master to be ready
    wait_for_node ${master_ip}

    # Install k3s agent
    if curl -sfL https://get.k3s.io | sh -s - agent \
        --node-name=${node_name} \
        --server=https://${master_ip}:6443 \
        --token=${k3s_token}; then
        echo "k3s agent installed successfully."
    else
        echo "Failed to install k3s agent."
        exit 1
    fi
fi 