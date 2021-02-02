#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::dependences {
    message_warning "Method Not Implement ${CORE_PACKAGE_NAME}"
}

function core::install {
    message_warning "Method Not Implement ${CORE_PACKAGE_NAME}"
}

function core::load {
    core::internal::core::load
}
