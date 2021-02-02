#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::internal::core::install {
    message_info "Installing ${CORE_PACKAGE_NAME}"
    git clone https://github.com/syndbg/core.git ~/.core
    message_success "Installed ${CORE_PACKAGE_NAME}"
}

function core::internal::core::init {
    message_warning "Method not implement for ${CORE_PACKAGE_NAME}"
}

function core::internal::core::load {
    message_warning "Method not implement for ${CORE_PACKAGE_NAME}"
}

function core::internal::curl::install {
    message_info "Installing curl for ${CORE_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${CORE_MESSAE_BREW}"
    fi
    brew install curl
    message_success "Installed curl for ${CORE_PACKAGE_NAME}"
}

function core::internal::less::install {
    message_info "Installing less for ${CORE_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${CORE_MESSAGE_BREW}"
        return
    fi
    brew install less
    message_success "Installed less for ${CORE_PACKAGE_NAME}"

}

function core::internal::most::install {
    message_info "Installing most for ${CORE_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${CORE_MESSAGE_BREW}"
        return
    fi
    brew install most
    message_success "Installed most for ${CORE_PACKAGE_NAME}"

}

function core::internal::rsync::install {
    if ! type -p brew > /dev/null; then
        message_warning "${CORE_MESSAGE_BREW}"
        return
    fi
    message_info "Installing rsync for ${CORE_PACKAGE_NAME}"
    brew install rsync
    message_success "Installed rsync ${CORE_PACKAGE_NAME}"
}

function core::internal::fzf::install {
    # shellcheck disable=SC2154
    message_info "Installing fzf for ${CORE_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${CORE_MESSAGE_BREW}"
        return
    fi
    brew install fzf
    message_success "Installed fzf for ${CORE_PACKAGE_NAME}"
}

function core::internal::yarn::install {
    message_info "Installing yarn for ${CORE_PACKAGE_NAME}"
    curl -o- -L https://yarnpkg.com/install.sh | bash
    message_success "Installed yarn ${CORE_PACKAGE_NAME}"
}

function core::internal::node::install {
    if ! type nvm > /dev/null; then
        message_warning "${CORE_MESSAGE_NVM}"
        return
    fi
    message_info "Installing version node ${CORE_PACKAGE_NAME}"
    nvm install --lts
    nvm use --lts --default
    message_success "Installed version node ${CORE_PACKAGE_NAME}"
}
