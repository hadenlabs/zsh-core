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

function core::internal::message::info {
    CLEAR='\033[0m'
    LIGHT_GREEN='\033[1;32m'

    printf "${CLEAR}${LIGHT_GREEN}[INFO]: %s ${CLEAR}\n" "${1}";
}

function core::internal::message::error {
    CLEAR='\033[0m'
    RED="\033[0;31m"

    printf "${CLEAR}${RED}[ERROR]: %s ${CLEAR}\n" "${1}"; return 0;
}

function core::internal::message::warning {
    CLEAR='\033[0m'
    YELLOW="\033[0;33m"

    printf "${CLEAR}${YELLOW}[WARNING]: %s ${CLEAR}\n" "$1";
}

function core::internal::message::success {
    CLEAR='\033[0m'
    GREEN="\033[0;32m"

    printf "${CLEAR}${GREEN}[SUCCESS]: %s ${CLEAR}\n" "$1";
}

function core::internal::multiplatform::install {
    message_warning "Method not implement for ${CORE_PACKAGE_NAME}"
}
