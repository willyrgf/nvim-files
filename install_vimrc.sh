#!/usr/bin/env bash

# https://github.com/willyrgf/nvim-files

OS="$(uname -s | tr 'A-Z' 'a-z')"

_pre_install() {
    # pre-requisites
    needed="nvim git ctags curl make"
    for b in $(echo "${needed}" | xargs -n 1) ; do
        if ! command -v "${b}" 2> /dev/null; then
            echo "command ${b} is not found"
            return 1
        fi
    done
}

_install() {
    # create base directory
    if ! mkdir -p ~/.config/nvim/backup; then
        echo "error on create nvim base directory"
        return 1
    fi

    # copy vimrc's
    if ! cp -av configs/*.{vim,json} ~/.config/nvim/; then
        echo "error on copy the vimrcs to home"
        return 1
    fi

    nvim +:PlugClean +q +q
    if ! nvim +:PlugInstall +q +q && nvim +:VimBootstrapUpdate +q +q; then
        echo "error on install vim plugins"
        return 1
    fi

    if ! nvim +:CocInstall coc-rust-analyzer +q +q; then
        echo "error on install coc install"
        return 1
    fi
}

_post_install() {
    # noop
    echo 
}

_main() {
    _pre_install &&
        _install &&
        _post_install
}

_main
