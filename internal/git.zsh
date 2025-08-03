#!/usr/bin/env ksh
# -*- coding: utf-8 -*-
#
function core::internal::git::get_module_path {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "unknown/unknown/$(basename "$(pwd)")"
    return
  fi

  local remote_url
  remote_url="$(git config --get remote.origin.url)"

  if [[ "$remote_url" =~ ^git@([^:]+):(.+)\.git$ ]]; then
    # git@github.com:hadenlabs/zsh-core.git → github.com/hadenlabs/zsh-core
    echo "${BASH_REMATCH[1]}/${BASH_REMATCH[2]}"
  elif [[ "$remote_url" =~ ^https?://([^/]+)/(.+)\.git$ ]]; then
    # https://github.com/hadenlabs/zsh-core.git → github.com/hadenlabs/zsh-core
    echo "${BASH_REMATCH[1]}/${BASH_REMATCH[2]}"
  else
    echo "unknown/unknown/$(basename "$(pwd)")"
  fi
}