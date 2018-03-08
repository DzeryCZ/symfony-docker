#!/usr/bin/env bash

# Install basic stuff
sudo apt-get -y install \
    nano \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

cd ~

# Install Docker
sudo curl -sSL https://get.docker.com/ | sh

# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Setup Samba drive
sudo apt-get -y install samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bck

# Add user = samba; passwd = samba
sudo useradd -p $(openssl passwd -1 symfony) symfony
(echo 'symfony'; echo 'symfony') | sudo smbpasswd -a symfony
sudo chown -R symfony:symfony /symfony-docker
sudo chmod -R 777 /symfony-docker

# Add content to samba configuration
sudo echo "[symfony]" | sudo tee -a /etc/samba/smb.conf
sudo echo "path = /symfony-docker" | sudo tee -a /etc/samba/smb.conf
sudo echo "valid users = symfony" | sudo tee -a /etc/samba/smb.conf
sudo echo "read only = no" | sudo tee -a /etc/samba/smb.conf
sudo echo "browsable = yes" | sudo tee -a /etc/samba/smb.conf
sudo echo "public = yes" | sudo tee -a /etc/samba/smb.conf
sudo echo "writable = yes" | sudo tee -a /etc/samba/smb.conf
sudo echo "available = yes" | sudo tee -a /etc/samba/smb.conf
# Restart Samba service
sudo /etc/init.d/samba restart

# Setup Docker for the project
cd /symfony-docker/
sudo docker-compose up -d