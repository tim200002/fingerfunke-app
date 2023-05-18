#!/usr/bin/env bash
# This scrips assumes to be executed from where it is located
# Define Relevant Environment Variables


# copy firebase config, from configuration repo to the right places
cp ../../../config-files/flutter_app/android/firebase/google-services.json ../../android/app/google-services.json
cp ../../../config-files/flutter_app/ios/firebase/firebase_app_id_file.json ../../ios/firebase_app_id_file.json
