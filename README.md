# Fingerfunke Flutter App

## Who are we

## Getting started

### Developement setup
```
flutter-version: 3.0.3
dart-version: 2.17.5
dev-tools-version: 2.12.2
```

### Setup
The old way of downloading config files from google is outdated. The new way is to use the firebase SDK as outlined [here](https://firebase.flutter.dev/docs/cli/).

You do not have to deal with any configurations manually, instead you must clone the [private config file repo](https://gitlab.com/fingerfunke/config-files) next to the root pf this project, then all configurations should be done automatically.



### Localization Files
to enable l10n a code generator must be executed. 
It can be started in one of two ways:
- starting the app (while ignoring build errors) starts the generator automatically
- running the generator manually:
  1. navigate to the `/lib/l10n/` directory
  2. in VS-Code right click on `app_en.arb` and select `Generate Localizations`

### Environment Variables
Generally the recommended way in dart to provide environment variables is via `dart-define`. Using this approach allows environment variables to be easily accessed both in dart code and in native code. A good tutorial for how to use `dart-define` is [this one](https://itnext.io/secure-your-flutter-project-the-right-way-to-set-environment-variables-with-compile-time-variables-67c3163ff9f4).

#### Configuration Setup
If you do not have to modify any environment variables, using the existing ones boils down, to make sure a valid `config.json` file is provided in the root of the project.
Then you can start the app with the default `run app` script (see `launch.json`in VS-Code).

Valid `config.json` files for local and production can be obtained in the [the private fingerfunke gitlab repo](https://gitlab.com/fingerfunke/config-files).

#### Using Environment Variables
**Dart Code**
To define an environment variable, just add it to the proper `config.json` file int config file repo next to this project (no copying required). The variable can then be accessed in the dart code using functions like ` String.fromEnvironment("EMULATOR_IP", defaultValue: "");`

**Android Code**
Environment variables can also be accessed in native android code. The process for this is explained very well in [this tutorial](https://itnext.io/secure-your-flutter-project-the-right-way-to-set-environment-variables-with-compile-time-variables-67c3163ff9f4)

**iOS Code**
Environment variables can also be accessed in native ios code. The process is however not document very well. I researched it with a combination of these two tutorials. [Tutorial 1](https://itnext.io/secure-your-flutter-project-the-right-way-to-set-environment-variables-with-compile-time-variables-67c3163ff9f4), [Tutorial 2](https://cocoacasts.com/tips-and-tricks-managing-build-configurations-in-xocde).

In easy words, environment variables are accessible on the ios side as build settings. These, however, cannot be accessed directly. Instead one must again add the same variable to the `info.plist` file. Then oen can access the variable in code using `Bundle.main.infoDictionary?["VARIABLE"]`. Again for more information please refer to the tutorial or to Tim Lindenau.


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
