#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::internal::core::install {
    message_info "Installing ${CORE_PACKAGE_NAME}"
    git clone https://github.com/syndbg/core.git ~/.core
    message_success "Installed ${CORE_PACKAGE_NAME}"
}

function core::internal::core::init {
    message_warning "Method not implement for ${CORE_PACKAGE_NAME}"
}

function core::internal::core::load {
    message_warning "Method not implement for ${CORE_PACKAGE_NAME}"
}

function core::internal::curl::install {
    message_info "Installing curl for ${CORE_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${CORE_MESSAE_BREW}"
    fi
    brew install curl
    message_success "Installed curl for ${CORE_PACKAGE_NAME}"
}