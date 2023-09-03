echo "Installing Neovim with Python extensions"
sudo add-apt-repository ppa:neovim-ppa/stable &&\
sudo apt-get update &&\
sudo apt-get install -y neovim python3-neovim

echo "Installing NodeJS"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

echo "Installing Github Copilot and Nodejs"
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
echo "Github Copilot: Start Neovim and invoke :Copilot setup"

echo "Installing Vim-Plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Vim-Plug installed: Start Neovim and invoke :PlugInstall

