#!/usr/bin/env bash
#
# Run all dotfiles installers.
set -e

source "$(dirname $0)"/../script/bashpodlib.sh

cd "$(dirname $0)"/..

# find the installers and run them iteratively except... ya know this one
find . -name install.sh -not -path "./script/*"| while read installer ; do sh -c "${installer}" ; done

success "Installed all the things"