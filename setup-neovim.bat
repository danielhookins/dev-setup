@echo off
SETLOCAL

:: Check if Chocolatey is installed
where choco >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    @echo Installing Chocolatey...
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

:: Install Neovim, Python, NodeJS, ripgrep, and fd
@echo Installing Neovim, Python, NodeJS, ripgrep, and fd...
choco install neovim python nodejs ripgrep fd -y
mkdir "%LOCALAPPDATA%\nvim\autoload" 2>nul

:: Create symlink for init.vim
@echo Creating symlink for init.vim...
IF NOT EXIST "%LOCALAPPDATA%\nvim" (
    mkdir "%LOCALAPPDATA%\nvim"
)
mklink "%LOCALAPPDATA%\nvim\init.vim" "%USERPROFILE%\.config\nvim\init.vim"

:: Set up Python for Neovim
@echo Setting up Python for Neovim...
python -m pip install pynvim

:: Install Github Copilot for Neovim
@echo Installing Github Copilot for Neovim...
mkdir "%LOCALAPPDATA%\nvim\pack\github\start" 2>nul
git clone https://github.com/github/copilot.vim.git "%LOCALAPPDATA%\nvim\pack\github\start\copilot.vim"
@echo Github Copilot: Start Neovim and invoke :Copilot setup

:: Install Vim-Plug for Neovim
@echo Installing Vim-Plug for Neovim...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -OutFile '%LOCALAPPDATA%\nvim\autoload\plug.vim'"
@echo Vim-Plug installed: Start Neovim and invoke :PlugInstall

ENDLOCAL
@echo Done!
