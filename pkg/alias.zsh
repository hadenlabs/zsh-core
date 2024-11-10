#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::cargo::install {
  core::internal::cargo::install "${@}"
}

function eza::load {

  alias ls='eza --icons=auto'
  alias ll='eza --long --header --git --group --icons=auto'
  alias lsa='eza --long --header --git --group --all --icons=auto'
}

function core::multiplatform::install {
  core::internal::multiplatform::install
}

if ! core::exists eza; then core::cargo::install eza; fi

if core::exists eza; then
    eza::load
fi