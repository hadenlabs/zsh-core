#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_CORE_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_CORE_PATH}"/config/linux.zsh
      ;;
    esac
}

core::config::main::factory
