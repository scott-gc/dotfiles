#!/usr/bin/env bash

set -e
[ -n "$PHPENV_DEBUG" ] && set -x

if [ -z "$PHPENV_ROOT" ]; then
  PHPENV_ROOT="${HOME}/.phpenv"
fi

shell="$1"
if [ -z "$shell" ]; then
  shell="$(ps c -p "$PPID" -o 'ucomm=' 2>/dev/null || true)"
  shell="${shell##-}"
  shell="${shell%% *}"
  shell="$(basename "${shell:-$SHELL}")"
fi

checkout() {
  if [ ! -d "$2" ] ;then
    git clone "$1" "$2"
  else
    git pull --no-rebase --ff
  fi
}

brew_library() {
    if [ "$(brew list | grep "$1")" ]
    then
      echo "  $1 installed"
    else
      echo "  installing $1"
      brew install $1
    fi
}

install_phpenv() {
  echo "  Installing phpenv"

  if [ -d "$PHPENV_ROOT" ]; then
    cd "$PHPENV_ROOT"
    git pull origin master
  else
    local PHPENV_REPO=https://github.com/phpenv/phpenv
    checkout "$PHPENV_REPO" "$PHPENV_ROOT"
  fi
}

install_plugin() {
  local vendor=${1%/*}
  local plugin=${1#*/}

  echo "  Installing $vendor/$plugin"
  checkout "https://github.com/${vendor}/${plugin}.git" "${PHPENV_ROOT}/plugins/${plugin}" &>/dev/null
}

for libary in "pkg-config" "autoconf" "openssl" "icu4c" "re2c" "bison" "libzip" "mcrypt" "libpng" "libjpeg"
do
    brew_library $libary
done

install_phpenv
install_plugin "php-build/php-build"
install_plugin "madumlao/phpenv-aliases"
install_plugin "ngyuki/phpenv-composer"
