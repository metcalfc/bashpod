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

  echo "  Installing Homebrew for you."
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
fi

check_brew_command powerline-go

success "Installed Homebrew Things"
exit 0
