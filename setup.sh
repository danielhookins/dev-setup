
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

echo "Installing Neovim with Python extensions"
if [ "$OS" == "Darwin" ]; then
    brew install neovim ripgrep fd
else
    sudo add-apt-repository ppa:neovim-ppa/stable &&\
        sudo apt-get install -y neovim python3-neovim ripgrep fd-find gcc g++
fi

echo "Installing NodeJS"
if [ "$OS" == "Darwin" ]; then
    arch -arm64 brew install node
else
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x focal main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    sudo apt-get update && \
        sudo apt-get install nodejs -y
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
