#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_CORE_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_CORE_PATH}"/internal/linux.zsh
      ;;
    esac
    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/internal/helper.zsh

    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/internal/git.zsh

    # shellcheck source=/dev/null
    source "${ZSH_CORE_PATH}"/internal/backup.zsh
}

core::internal::main::factory