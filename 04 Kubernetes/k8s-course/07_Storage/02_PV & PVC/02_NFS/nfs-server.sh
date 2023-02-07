#!/bin/bash

# Install NFS Kernel Server
sudo apt-get update
sudo apt-get install -y nfs-kernel-server

# Create the Export Directory
sudo mkdir -p /mnt/appdata

# set all clients access to the directory
sudo chown nobody:nogroup /mnt/appdata
sudo chmod 777 /mnt/appdata

echo "/mnt/appdata *(rw,sync,no_subtree_check,no_root_squash,insecure)" | sudo tee /etc/exports
sudo exportfs -rv
sudo showmount -e
sudo systemctl restart nfs-kernel-server