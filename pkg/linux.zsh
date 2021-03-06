#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

if ! core::exists xclip; then core::install xclip; fi

function open {
    if [ -e /usr/bin/xdg-open ]; then
        xdg-open "${1}"
    fi
}

function pbcopy {
    if type xclip > /dev/null; then
        xclip -selection clipboard
    fi
    if type xsel > /dev/null; then
        xsel --clipboard --input
    fi
}

function pbpaste {
    if type xclip > /dev/null; then
        xclip -selection clipboard -o
    fi
    if type xsel > /dev/null; then
        xsel --clipboard --output
    fi
}