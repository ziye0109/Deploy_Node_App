#!/bin/sh
set -e

#Check if git-secrets installed.
#echo "Checking if git-secrets installed"
#if [ -x "$(command -v git-secrets)" ]; then 
#    echo "Git Secrets already installed." >&2
#    exit 1
#fi

#If git-secrets not installed, ask user permission to intall.
while true; do 
    read -p "Do you want to install git-secrets to preventing commit your secret?" yn
    case $yn in 
        [Yy]* ) echo "intall"; break;;
        [Nn]* ) exit;;
        *) echo "Please answer yes or no.";;
    esac
done

#Delete git-secret if exist
echo "Delete git-secret"
rm -rf ./git-secret

#Download git-secret
#echo "Download git-secret"
#git clone https://github.com/sobolevn/git-secret.git git-secret

#Build git-secret
#echo "Build git-secret"
#cd git-secret && make build

#Install git-secret
#echo "Intall git-secret"
#PREFIX="/usr/local" make install
#sleep 5

echo "Install using brew"
brew install git-secrets
sleep 5

#TODO: check if pre-commit hooks already exist in the current app, if NO install hooks, if YES append the hooks to exist pre-commit hooks.
echo "Intall git-secret hooks"
git secrets --install -f
sleep 5

#Add AWS secrets patterns
echo "Add AWS as provider and register common patterns for AWS"
git secrets --register-aws
sleep 5

#Add your own secrets patterns
echo "Add Other prohibited pattern"
git secrets --add 'CLIENT_SECRET\s*:\s*[\w.]+'
git secrets --add '/password\s*(:|=)\s*.+/i'
git secrets --add '/username\s*(:|=)\s*.+/i'
git secrets --add 'SESSION_KEY\s*(:|=)\s*.+'
git secrets --add 'TOKEN\s*(:|=)\s*.+'
git secrets --add 'IDENTITY_KEY_PASSPHRASE\s*(:|=)\s*.+'
git secrets --add 'ACCESS_KEY\s*(:|=)\s*.+'

#List all secrets patterns 
git secrets --list

echo "Git Secrets commit hooks is ready!"