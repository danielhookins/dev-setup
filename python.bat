@echo off
setlocal

REM Check if Chocolatey is installed
where choco >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    @echo Installing Chocolatey...
    @%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
)

REM Install the latest version of Python 3 using Chocolatey
choco install python3 -y

REM Check if Node.js and npm are installed
where node >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    @echo Installing Node.js and npm...
    choco install nodejs -y
)

REM Install the Pyright language server using npm
npm install -g pyright

REM Get the global npm binaries directory and add it to the PATH
for /f "tokens=*" %%i in ('npm prefix -g') do set NPM_BIN_DIR=%%i\bin
setx PATH "%PATH%;%NPM_BIN_DIR%"


REM Add exclusions for the Pyright language server
powershell -ExecutionPolicy Bypass -Command "pyright-langserver --version"
powershell -ExecutionPolicy Bypass -Command "pyright-langserver --stdio"

@echo Setup completed!

endlocal

