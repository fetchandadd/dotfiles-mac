#!/bin/bash

function apply_ssh(){
  echo "Applying config for ssh..."
  mkdir -p ~/.ssh
  cp ./ssh/config ~/.ssh/config
}

function tmux(){
  echo "Applying config for tmux..."
  cp ./tmux/tmux.conf ~/.tmux.conf
}

function tmuxinator(){
  echo "Applying config for tmuxinator..."
  mkdir -p ~/.tmuxinator
  cp ./tmuxinator/hud.yml ~/.tmuxinator/hud.yml
}

function fish(){
  echo "Applying config for fish..."
#  mkdir -p ~/.config/fish/functions
#  cp ./fish/functions/*.fish ~/.config/fish/functions/
  cp ./fish/config.fish ~/.config/fish/config.fish
}

function git(){
  echo "Applying config for git..."
  cp ./git/gitignore ~/.gitignore
  cp ./git/gitconfig ~/.gitconfig
}

function osx(){
  echo "Applying config for osx..."
  bash ./osx/set-defaults.sh
}

function iterm(){
  echo "Applying config for iterm2..."
  bash ./iterm2/set-defaults.sh
}


case "$1" in
	all)
          apply_ssh
          tmux
          tmuxinator
	  fish
          git
          osx
          iterm
	  ;;
        ssh)
          apply_ssh
          ;;
        tmux)
          tmux
          ;;
        tmuxinator)
          tmuxinator
          ;;
        fish)
	  fish
          ;;
        git)
          git
          ;;
        osx)
          osx
          ;;
        iterm)
          iterm
          ;;
        *)
            echo $"Usage: $0 {all|ssh|tmux|tmuxinator|fish|git|osx|iterm}"
            exit 1
esac
