echo "Installing Neovim with Python extensions"
sudo apt-get install -y neovim python3-neovim

echo "Installing NodeJS"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

echo "Installing Github Copilot and Nodejs"
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
echo "Github Copilot: Start Neovim and invoke :Copilot setup"
