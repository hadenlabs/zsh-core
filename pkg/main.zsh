#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_CORE_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_CORE_PATH}"/pkg/linux.zsh
      ;;
    esac
    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/pkg/helper/main.zsh

    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/pkg/docker.zsh

    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/pkg/alias.zsh
}

core::pkg::main::factory