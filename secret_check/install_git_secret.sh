#!/bin/sh
set -e

echo "Check if git-secrets exist"
if [ -x "$(command -v git-secrets)" ]; then 
    echo "git-secrets already installed." >&2
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
git secrets --add 'ES_AUTH\s*:\s*(.+\s*.*):(.+\s*.*)$'
git secrets --add 'ES_HOST\s*:\s*(http|https)://(.+\s*.*):(.+\s*.*)@.+'
git secrets --add 'CLIENT_ID\s*:\s*[\w.]+'
git secrets --add 'CLIENT_SECRET\s*:\s*[\w.]+'
git secrets --add '(password|PASSWORD)\s*(:|=)\s*.+'
git secrets --add '(username|USERNAME)\s*(:|=)\s*.+'
git secrets --add 'SESSION_KEY\s*(:|=)\s*.+'
git secrets --add 'AUTH_TOKEN\s*(:|=)\s*.+'
git secrets --add 'IDENTITY_KEY_PASSPHRASE\s*(:|=)\s*.+'
git secrets --add '\s*TOKEN\s*'
git secrets --add 'API_KEY'

echo "Installation is done"

