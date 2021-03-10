#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::internal::core::install {
    message_info "Installing ${CORE_PACKAGE_NAME}"
    message_success "Installed ${CORE_PACKAGE_NAME}"
}

function core::internal::core::load {
    message_warning "Method not implement for ${CORE_PACKAGE_NAME}"
}

function core::internal::core::exists {
    command -v "${1}" > /dev/null
}
