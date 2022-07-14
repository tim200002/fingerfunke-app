# Fingerfunke Flutter App

## Who are we

## Getting started

### Developement setup
```
flutter-version: 3.0.3
dart-version: 2.17.5
dev-tools-version: 2.12.2
```

### Firebase Config files

Before installing the flutter app one must add the (secret) `firebase config files` to ones own developement environment. These files are kept in a private fingerfunke gitlab-repo [here](https://gitlab.com/fingerfunke/config-files). If you are part of the team you should be able to just access them. If you are new and want to contribute to this project [please contact the team](mailto:info@fingerfunke.app) and we will give you access.

After downlaoding these files you must copy them to the propper location

```
# for Android (google-services.json)
android/app/google-services.json

# for iOS (GoogleService-Info.plist)
ios/GoogleService-Info.plist
```

### Localization Files
to enable l10n a code generator must be executed. 
It can be started in one of two ways:
- starting the app (while ignoring build errors) starts the generator automatically
- running the generator manually:
  1. navigate to the `/lib/l10n/` directory
  2. in VS-Code right click on `app_en.arb` and select `Generate Localizations`

### Environment Variables

You must also provide a valid `.env` file. The `.env.example` file is a blueprint how this file should look like. Prebuilt configuration for local use as well as production can be found in [the private fingerfunke gitlab repo](https://gitlab.com/fingerfunke/config-files).

**List of all Environment Variables which must be set**
|Variable|description|valid values|
|---|---|---|
|FIREBASE_ENVIRONMENT|Whether to use production backend or local emulator suite|local; production

Now you are ready to start developing. Have fun and thanks for contributing :)


# Releases

Releases are named using [sematic versioning](https://semver.org/lang/de/) in addition with the current build number. A valid release tag would therefore look somehting like this `v1.2.4+2`. Please `tag` every release in Git and add meaningful release notes

- Major release: A major release increments the first number. This is done when there are significant changes in the feature set of the App
- Minor Release: A minor release increments the second nunber. This is done when new functionality has been added to the App
- Patch release: A patch release icrements the third number. This is done when only bugs have been fixed

The build number must automatically be incremented with every new release
