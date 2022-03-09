#!/usr/bin/env bash

set -e

source "$(dirname $0)"/../script/bashpodlib.sh

check_brew_command jq
check_brew_command yq

success "Installed Utility Things"