#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::pkg::helper::factory {
    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/pkg/helper/backup.zsh

    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/pkg/helper/core.zsh
}

core::pkg::helper::factory