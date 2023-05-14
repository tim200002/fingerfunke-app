#!/usr/bin/env bash
# Define Relevant Environment Variables
export IPA_OUTPUT_PATH="../build/ios/ipa/fingerfunke_app.ipa"

cd ios
fastlane prepare

# After preparation print whats going to happen including values of environment variables
echo "Preparation finished and ios build will start now with the following environment variables:"
echo "IPA_OUTPUT_PATH: $IPA_OUTPUT_PATH"
echo "FLUTTER_BUILD_NUMBER: $FLUTTER_BUILD_NUMBER"

cd ..
flutter build ipa --release --dart-define-from-file=/Users/timlindenau/Programmieren/Flutter/fingerfunke/config-files/flutter_app/config.production.json --export-options-plist=./ios/export_options.plist

cd ios
fastlane beta