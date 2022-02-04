# Fingerfunke Flutter App

## Who are we

## Getting started

### Firebase Config files

Before installing the flutter app one must add the (secret) `firebase config files` to ones own developement environment. These files are kept in a private fingerfunke gitlab-repo [here](https://gitlab.com/fingerfunke/config-files). If you are part of the team you should be able to just access them. If you are new and want to contribute to this project [please contact the team](mailto:info@fingerfunke.app) and we will give you access.

After downlaoding these files you must copy them to the propper location

```
# for Android (google-services.json)
android/app/google-services.json

# for iOS (GoogleService-Info.plist)
ios/GoogleService-Info.plist
```

### Environment Variables

You must also provide a valid `.env` file. The `.env.example` file is a blueprint how this file should look like. Prebuilt configuration for local use as well as production can be found in [the private fingerfunke gitlab repo](https://gitlab.com/fingerfunke/config-files).

**List of all Environment Variables which must be set**
|Variable|description|valid values|
|---|---|---|
|FIREBASE_ENVIRONMENT|Whether to use production backend or local emulator suite|local; production

Now you are ready to start developing. Have fun and thanks for contributing :)
