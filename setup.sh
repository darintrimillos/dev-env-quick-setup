#!/bin/sh

read -p "This script is meant to run on a clean OS installation. Press [enter] to continue."

# NVM and Node
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
nvm install --lts

# Git
sudo apt install git-all
read -p "Github display name: " githubDisplayName
read -p "Github email: " githubEmail
git config --global user.name $githubDisplayName
git config --global user.email $githubEmail

# Create code directory
mkdir ~/Code

# Visual Studio Code
sudo snap install --classic code

# Utilities
sudo apt install xclip
sudo apt install vim
sudo update-alternatives --config editor

# SSH Setup
read -p "Email for SSH Key: " sshEmail
ssh-keygen -t rsa -b 4096 -C $sshEmail
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa # this will fail if not using the default name
xclip -sel clip < ~/.ssh/id_rsa.pub

clear
read -p "Your public SSH key has been copied to your clipboard. Press [enter] to complete installation".

kill -9 $PPID