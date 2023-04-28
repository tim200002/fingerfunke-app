#!/usr/bin/env bash
cd ios
fastlane prepare

cd ..
flutter build ios --release --no-codesign --dart-define-from-file=/Users/timlindenau/Programmieren/Flutter/fingerfunke/config-files/flutter_app/config.production.json

cd ios
fastlane beta