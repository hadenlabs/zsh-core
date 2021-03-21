#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

if ! core::exists exa; then core::install exa; fi

function exa::load {
    alias l='exa --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias ls='exa --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias ll='exa -l --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias lll='exa -l --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale | less'
    alias lla='exa -la --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias llt='exa -T --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
    alias llfu='exa -bghHliS --all --grid --git --sort=ext --color=always --group-directories-first --icons --color-scale'
}

if core::exists exa; then
    exa::load
fi
