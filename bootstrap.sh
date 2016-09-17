#!/bin/bash

# Install homebrew:
printf "Is homebrew installed?"
if [ ! -f /usr/local/bin/brew ]
  then
    printf " No\n"
    printf "Installing homebrew.\n"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
   printf " Yes\n"
fi

# Update homebrew:
printf "Updating to newest version of Homebrew and all formulae.\n"
brew update

# Install git:
printf "Is git installed?"
if [ ! -f /usr/bin/git ]
  then
    printf " No\n"
    printf "Installing git.\n"
    brew install git
  else
    printf " Yes\n"
fi

# Clone dotfiles:
printf "Cloning dotfiles.\n"
git clone git@github.com:timtegeler/dotfiles.git
