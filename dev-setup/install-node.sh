#! /bin/bash

# Bash script to install node v20.11.0
# https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz

# Download node
wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz

# Extract node
tar -xvf node-v20.11.0-linux-x64.tar.xz

# Move node to /usr/local
sudo mv node-v20.11.0-linux-x64 /usr/local

# Create a symbolic link
sudo ln -s /usr/local/node-v20.11.0-linux-x64/bin/node /usr/bin/node
sudo ln -s /usr/local/node-v20.11.0-linux-x64/bin/npm /usr/bin/npm

# Check node version
node -v

# Check npm version
npm -v

# Remove node tar file
rm node-v20.11.0-linux-x64.tar.xz

# Remove node folder
rm -rf node-v20.11.0-linux-x64
