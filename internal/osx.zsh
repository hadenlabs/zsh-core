#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::internal::core::install {
    brew install "${@}"
}

function core::internal::android::install {

  message_info "Installing android"

  touch "${ANDROID_FILE_REPOSITORIES}"
  mkdir -p "${ANDROID_HOME}"

  [ "$(! core::exists java)" ] && brew install openjdk@11 openjdk@17
  [ "$(! core::exists sdkmanager)" ] && brew install android-commandlinetools

  sdkmanager --update --sdk_root="${ANDROID_HOME}"
  sdkmanager --install "cmdline-tools;latest" --sdk_root="${ANDROID_HOME}"
  yes | sdkmanager "platforms;android-${ANDROID_PLATFORM_VERSION}" --sdk_root="${ANDROID_HOME}"
  yes | sdkmanager "platform-tools" --sdk_root="${ANDROID_HOME}"
  yes | sdkmanager "platform-tools" "build-tools;${ANDROID_SDK_VERSION}" --sdk_root="${ANDROID_HOME}"
  yes | sdkmanager "extras;google;m2repository" --sdk_root="${ANDROID_HOME}"
  yes | sdkmanager "extras;android;m2repository" --sdk_root="${ANDROID_HOME}"

  message_success "android Installed"
}

function core::internal::osx::dependences::install {
  message_info "Installing Dependences for osx"
  if ! core::exists gem; then
    message_warning "${CORE_MESSAGE_RVM}"
    return
  fi

  gem install cocoapods

  brew install --HEAD usbmuxd
  brew link usbmuxd
  brew install --HEAD libimobiledevice
  brew install ideviceinstaller cocoapods ios-deploy
  pod setup

  message_success "osx Dependences Installed"
}

function core::internal::multiplatform::install {
  if ! core::exists brew; then
    message_warning "${CORE_MESSAGE_BREW}"
    return
  fi

  message_info "Installing Dependences for multiplatform"

  core::internal::osx::dependences::install
  core::internal::android::install

  message_success "Multiplatform Dependences Installed"
}