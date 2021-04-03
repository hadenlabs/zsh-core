#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::internal::core::is_cask {
    local app_search
    app_search="${1}"
    for app in "${CORE_APP_CASK[@]}"; do
        if [[ "${app}" == "${app_search}" ]]; then
            echo "1"
            return
        fi
    done
    return 0
}

function core::internal::core::install {
    local app args
    app="${1}"
    if [[ $(core::internal::core::is_cask "${app}") == "1" ]]; then
        args='--cask'
    fi
    if [ -z "${args}" ]; then
        brew install "${app}"
        return
    fi
    brew install "${args}" "${app}"

}
