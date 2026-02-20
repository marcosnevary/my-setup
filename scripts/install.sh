#!/bin/bash

set -e

printf "> Starting setup...\n"

if ! command -v brew &>/dev/null; then
  printf "🍺 Installing Homebrew...\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update

printf "> Installing tools...\n"
brew install git stow kitty neovim

printf "> Installing apps...\n"
brew install --cask google-chrome bitwarden filen obsidian discord spotify bartender bettertouchtool linearmouse

printf "> Installing fonts...\n"
brew install --cask font-jetbrains-mono-nerd-font

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  printf "> Installing Oh My Zsh...\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

git config --global user.name "marcosnevary"
git config --global user.email "marcos.nevary@gmail.com"

mkdir ~/Desktop/omnia/
mkdir ~/Desktop/github/
cd ~/Desktop/github/
git clone https://github.com/marcosnevary/setup.git

printf "> Linking dotfiles...\n"
cd ./config
stow zsh kitty nvim

printf "> Setup complete. Please restart Kitty.\n"
