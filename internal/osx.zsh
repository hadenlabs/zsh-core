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

function core::internal::multiplatform::install {
    if ! core::exists brew; then
        message_info "${CORE_MESSAGE_BREW}"
        return
    fi

    message_info "Installing Dependences for multiplatform"

    gem install cocoapods

    brew install --HEAD usbmuxd
    brew link usbmuxd
    brew install --HEAD libimobiledevice
    brew install ideviceinstaller cocoapods ios-deploy
    pod setup

    touch "${ANDROID_FILE_REPOSITORIES}"
    mkdir -p "${ANDROID_HOME}"

    [ "$(! core::exists java)" ] && brew install openjdk@11 openjdk@17
    [ "$(! core::exists sdkmanager)" ] && brew install --cask android-commandlinetools

    sdkmanager --update --sdk_root="${ANDROID_HOME}"
    sdkmanager --install "cmdline-tools;latest" --sdk_root="${ANDROID_HOME}"
    yes | sdkmanager "platforms;android-${ANDROID_PLATFORM_VERSION}" --sdk_root="${ANDROID_HOME}"
    yes | sdkmanager "platform-tools" --sdk_root="${ANDROID_HOME}"
    yes | sdkmanager "platform-tools" "build-tools;${ANDROID_SDK_VERSION}" --sdk_root="${ANDROID_HOME}"
    yes | sdkmanager "extras;google;m2repository" --sdk_root="${ANDROID_HOME}"
    yes | sdkmanager "extras;android;m2repository" --sdk_root="${ANDROID_HOME}"

    flutter config --android-sdk "${ANDROID_HOME}"

    yes | flutter doctor --android-licenses --sdk_root="${ANDROID_HOME}"
    message_success "Multiplatform Dependences Installed"
}