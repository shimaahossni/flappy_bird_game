#!/bin/sh

# The CI_PRIMARY_REPOSITORY_PATH is the path to the root of your repository.
cd $CI_PRIMARY_REPOSITORY_PATH

# Install Flutter
git clone https://github.com/flutter/flutter.git --depth 1 -b stable $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Check Flutter version
flutter --version

# Precache iOS artifacts
flutter precache --ios

# Install dependencies
flutter pub get

# Install CocoaPods dependencies
cd ios
pod install

exit 0
