echo "Installing Pre-requisites"
sudo apt-get update &&\
    sudo apt-get install -y ca-certificates curl gnup &&\
    sudo mkdir -p /etc/apt/keyrings

echo "Installing Neovim with Python extensions"
sudo add-apt-repository ppa:neovim-ppa/stable &&\
    sudo apt-get install -y neovim python3-neovim ripgrep fd-find

echo "Installing NodeJS"
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x focal main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update && \
    sudo apt-get install nodejs -y

echo "Installing Github Copilot and Nodejs"
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
echo "Github Copilot: Start Neovim and invoke :Copilot setup"

echo "Installing Vim-Plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Vim-Plug installed: Start Neovim and invoke :PlugInstall"

