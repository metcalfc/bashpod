#!/usr/bin/env bash

set -e

source "$(dirname $0)"/../script/bashpodlib.sh

check_brew_command git
check_brew_command gh

success "Installed Git Things"