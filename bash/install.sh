#!/usr/bin/env bash
set -e

source "$(dirname $0)"/../script/bashpodlib.sh

check_brew_command powerline-go
check_brew_package bash-completion@2

success "Installed Bash Things"