#!/bin/sh
set -e

echo "Checking if git-secrets installed"
if [ -x "$(command -v git-secrets)" ]; then 
    echo "Git Secrets already installed." >&2
    exit 1
fi

while true; do 
    read -p "Do you want to install git-secrets to preventing commit your secret?" yn
    case $yn in 
        [Yy]* ) echo "intall"; break;;
        [Nn]* ) exit;;
        *) echo "Please answer yes or no.";;
    esac
done

echo "Download git-secret"
git clone https://github.com/sobolevn/git-secret.git git-secret

echo "Build git-secret"
cd git-secret && make build

echo "Intall git-secret"
PREFIX="/usr/local" make install

echo "Intall git-secret hooks"
git secrets --install -f

echo "Add AWS as provider and register common patterns for AWS"
git secrets --register-aws

echo "Add Other prohibited pattern"
git secrets --add 'CLIENT_SECRET\s*:\s*[\w.]+'
git secrets --add '/password\s*(:|=)\s*.+/i'
git secrets --add '/username\s*(:|=)\s*.+/i'
git secrets --add 'SESSION_KEY\s*(:|=)\s*.+'
git secrets --add 'TOKEN\s*(:|=)\s*.+'
git secrets --add 'IDENTITY_KEY_PASSPHRASE\s*(:|=)\s*.+'
git secrets --add 'API_KEY'

echo "Git Secrets commit hooks is ready!"

