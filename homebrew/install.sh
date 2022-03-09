#!/usr/bin/env bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
source "$(dirname $0)"/../script/bashpodlib.sh

# Check for Homebrew
if test ! $(which brew)
then
  if [ "${GITPOD_REPO_ROOT}" == "/workspace/dotfiles"]; then

    echo "  Installing Homebrew in Gitpod for you to test."
    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
    mkdir ~/.linuxbrew/bin
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
    eval $(~/.linuxbrew/bin/brew shellenv)

  else

    echo "  Installing Homebrew for you."
    /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  fi
  
fi

check_brew_command powerline-go

success "Installed Homebrew Things"
exit 0
