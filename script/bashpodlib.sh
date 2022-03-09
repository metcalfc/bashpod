
if test ! $(which brew)
then
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  test -d /opt/homebrew && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

function info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

function user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

function success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

function fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

function check_brew_command () {

    cmd=${1}
    pkg=${2:-${1}}

    if ! command -v ${cmd} &> /dev/null
    then
        brew install ${pkg}
        return $?
    fi

}

function check_brew_package () {

    pkg=${1}
    
    brew list ${pkg} &> /dev/null || brew install ${pkg}

}
