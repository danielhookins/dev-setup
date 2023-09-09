@echo off
REM Check if Chocolatey is installed
where choco >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    @echo Installing Chocolatey...
    @%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

REM Creating Symlinks for Neovim config
mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\.config\nvim

REM Installing Neovim, ripgrep, fd, and NodeJS
choco install neovim ripgrep fd nodejs

REM Installing GitHub Copilot for Neovim
mkdir %USERPROFILE%\.config\nvim\pack\github\start
git clone https://github.com/github/copilot.vim.git %USERPROFILE%\.config\nvim\pack\github\start\copilot.vim
@echo Github Copilot: Start Neovim and invoke :Copilot setup

REM Installing Packer for Neovim
mkdir %LOCALAPPDATA%\nvim\pack\packer\start
git clone --depth 1 https://github.com/wbthomason/packer.nvim %LOCALAPPDATA%\nvim\pack\packer\start\packer.nvim

@echo Setup completed!
