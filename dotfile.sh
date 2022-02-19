#!/usr/bin/env bash

SCRIPT_LOCATION=$(pwd)
SCRIPT_USER=$(whoami)
SCRIPT_USERID=$(id -u)

#region Prechecks

if [[ $(uname) != "Darwin" ]]; then
    echo "error: script can only be executed on macOS"
    exit 1
fi

if [[ $(id -u) -eq 0 ]]; then
    echo "error: do not run script as root. password will be prompted if needed"
    exit 1
fi

#endregion Prechecks

#region Install Brew & Brew Cask

echo "Installing Brew"

# pipe echo to make brew install unattended
echo | bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap homebrew/cask

echo "*============================*"
echo "Installling brew programs"
echo "Installing common programs"
# common programs
brew install --cask maccy
brew install --cask slack
brew install --cask signal
brew install --cask whatsapp
brew install --cask notion
brew install --cask spotify
brew install --cask 1password
brew install --cask protonvpn
brew install --cask google-chrome
brew install --cask microsoft-edge

echo "*====*"
echo "Installing school and office"
# school and office
brew install --cask skype
brew install --cask dropbox
brew install --cask zoom
brew install --cask onedrive
brew install --cask obsidian
brew install --cask typora
brew install --cask microsoft-office
brew install --cask microsoft-teams

echo "*====*"
echo "Installing VMs programs"
# VMs programs
brew install --cask vmware-fusion
brew install --cask parallels
brew install --cask microsoft-remote-desktop

echo "*====*"
echo "Installing dev tools"
# dev tools
brew install --cask mamp
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask cyberduck
brew install --cask github
brew install --cask postman
brew install --cask intellij-idea-ce
brew install --cask local
brew install --cask vmware-fusion
brew install --cask parallels
brew install --cask microsoft-remote-desktop

echo "*====*"
echo "Installing design and present tools"
# design and present tools
brew install --cask affinity-photo
brew install --cask affinity-publisher
brew install --cask affinity-designer
brew install --cask figma
brew install --cask pitch


echo "all Brew programs installed"
echo "*============================*"
echo "start general configuration"

# Copy VSCode settings
cp .vscode/settings.json "$HOME/Library/Application Support/Code/User/"

# copy dotfile
cp .gitconfig ~/
