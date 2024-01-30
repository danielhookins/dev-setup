
# Check OS type
OS="$(uname)"
if [ "$OS" == "Darwin" ]; then
    # Check if Homebrew is installed
    if ! command -v brew &>/dev/null; then
        echo "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    BREW_PREFIX=$(brew --prefix)
fi

echo "Installing Pre-requisites"
if [ "$OS" == "Darwin" ]; then
    brew install curl gnu-tar gpg
else
    sudo apt-get update &&\
        sudo apt-get install -y ca-certificates curl gnupg &&\
        sudo mkdir -p /etc/apt/keyrings
fi

echo "Building Neovim from source"
./install-neovim.sh

echo "Installing Neovim Python extensions and requirements"
if [ "$OS" == "Darwin" ]; then
    brew install ripgrep fd
else
    sudo apt-get install -y python3-neovim ripgrep fd-find gcc g++
fi

echo "Installing NodeJS"
if [ "$OS" == "Darwin" ]; then
    arch -arm64 brew install node
else
    echo "Running install node script"
    ./install-node.sh
fi

echo "Installing Github Copilot for Neovim"
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
echo "Github Copilot: Start Neovim and invoke :Copilot setup"

echo "Installing Packer for Neovim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Installing tmux"
if [ "$OS" == "Darwin" ]; then
    brew install tmux
else
    sudo apt-get install -y tmux
fi

if [ "$OS" == "Darwin" ]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-hack-nerd-font
else    
    sudo apt-get install -y fonts-hack-nerd-font
fi
