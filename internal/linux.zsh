#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::internal::core::install {
    if ! core::internal::core::exists brew; then
        message_warning "${CORE_MESSAGE_BREW}"
    fi
    brew install "${@}"
}