#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::internal::core::install {
    if ! core::internal::core::exists brew; then
        message_warning "${CORE_MESSAGE_BREW}"
    fi
    brew install "${@}"
}

function core::internal::core::load {
    message_warning "Method not implement for ${CORE_PACKAGE_NAME}"
}

function core::internal::core::exists {
    command -v "${1}" > /dev/null
}
