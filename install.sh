#!/bin/bash

# Check homebrew:
if [ ! -f /usr/local/bin/brew ]
  then
    printf "Homebrew is not istalled!\n"
  else
    # Brewfile:
    printf "Installing apps from Brewfile.\n"
    brew update
    brew tap caskroom/cask
    brew tap homebrew/bundle
    brew bundle

    # Gemfile:
    printf "Installing apps from Gemfile.\n"
    sudo gem install bundler
    bundle install

    # Npm packages:
    if [ ! -f /usr/local/bin/npm ]
      then
        printf "Npm ist not installed!\n"
      else
        printf "Installing global npm packages.\n"
        bash npm-global-packages.sh
    fi

    # Changing shell to fish:
    sudo echo $(which fish) >> /etc/shells
    chsh -s $(which fish)
    curl -L http://get.oh-my.fish | fish
    omf install agnoster
    # Installing powerline fonts:
    git clone https://github.com/powerline/fonts.git
    cd fonts/
    bash install.sh
    cd ..
    rm -rf fonts

    #mkdir -p ~/.config/fish/completions/
    #cp ~/.bin/tmuxinator.fish ~/.config/fish/completions/
fi
