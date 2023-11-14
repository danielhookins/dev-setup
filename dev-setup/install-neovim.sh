#!/bin/bash

# NeoVim

# install dependencies
sudo apt-get install ninja-build \
     gettext libtool libtool-bin \
     autoconf automake cmake g++ \
     pkg-config unzip

# return to home directory
cd ~

# clone neovim 
git clone https://github.com/neovim/neovim.git

# change directory to neovim
cd neovim

# checkout stable version
git checkout stable

# build neovim
make CMAKE_BUILD_TYPE=Release \
     CMAKE_INSTALL_PREFIX=<NEOVIM_LOCATION> install

# install neovim
sudo make install

# add neovim path to bashrc
echo "export PATH=/usr/local/bin:$PATH" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc
echo "alias vi='nvim'" >> ~/.bashrc
