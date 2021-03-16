#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::install {
    core::internal::core::install "${@}"
}

function core::load {
    core::internal::core::load
}

function core::exists {
    core::internal::core::exists "${1}"
}
