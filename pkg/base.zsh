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

function message_info {
    core::internal::message::info "${1}"
}

function message_error {
    core::internal::message::error "${1}"
}

function message_warning {
    core::internal::message::warning "${1}"
}

function message_success {
    core::internal::message::success "${1}"
}