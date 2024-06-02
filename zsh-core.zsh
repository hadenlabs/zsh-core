#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install core for osx or linux.
#
# Authors:
#   Luis Mayta <luis@hadenlabs.com>
#

# shellcheck disable=SC2034  # Unused variables left for readability
ZSH_CORE_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_CORE_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_CORE_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_CORE_PATH}"/pkg/main.zsh