#!/bin/bash

# installing stylua
echo -e "Installing stylua, formatter for nvim"
echo | brew install stylua

echo -e "Installing flake8"
brew install flake8

echo -e "Installing black"
brew install black

echo -e "Installing bash formatter"
curl -sS https://webi.sh/shfmt | sh

echo -e "Installing fd"
brew install fd

echo -e "Installing ripgrep"
brew install ripgrep

echo -e "Installing node and npm"
brew install node

echo -e "Installing golang"
brew install golang

echo -e "Installing prettier"
brew install prettier
