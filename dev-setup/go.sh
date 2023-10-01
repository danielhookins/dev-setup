#! /bin/bash

sudo apt update && sudo apt upgrade

wget https://go.dev/dl/go1.21.1.linux-amd64.tar.gz
sudo tar -xvf go1.21.1.linux-amd64.tar.gz -C /usr/local

echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

go version

rm go1.21.1.linux-amd64.tar.gz
