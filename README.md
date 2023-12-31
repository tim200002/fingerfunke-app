# Fingerfunke Flutter App

## What is Fingerfunke
The goal of fingerfunke was to create an App to better connect the deaf-language community in Germany. To achieve this we developed a platform to create events and form groups. Our main focus point was to prioritize the needs of deaf people. This for example meant to focus on video as the primary means of communicating, instead of text.

Unfortunately, **as of September 2023, the project is paused and no further work will be completed for the foreseeable future**. Of course, if someone wants to take over this project, please feel free to contact Tim at tim.lindenau@outlook.de

This repository is only a mirror of the original one. The original code including all supporting repositories can be found in our [GitLab](https://gitlab.com/fingerfunke).

## Fingerfunke in Images

<table>
  <tr>
    <td>
      <h3> Main Feed </h3>
      <img src="https://github.com/tim200002/fingerfunke-app/assets/48860268/0a455041-4d77-430d-98f1-e463cff461f3" alt="Main Feed"/>
      <p>A glimpse into the main feed, showcasing the latest events and updates.</p>
    </td>
    <td>
      <h3> Event Details Page </h3>
      <img src="https://github.com/tim200002/fingerfunke-app/assets/48860268/39d498a1-7575-4963-95ac-af241bd4a4f1" alt="Event Details Page"/>
      <p>Detailed view of event information, including time, location, and attendees.</p>
    </td>
  </tr>
  <tr>
    <td>
      <h3> Event Editor </h3>
      <img src="https://github.com/tim200002/fingerfunke-app/assets/48860268/33aa4970-a8f7-4955-9451-c7506b1612e3" alt="Event Editor"/>
      <p>Interface for creating and editing event details.</p>
    </td>
    <td>
      <h3> Chat </h3>
      <img src="https://github.com/tim200002/fingerfunke-app/assets/48860268/0eea7409-095c-4fa1-b31e-5c3ddae69523" alt="Chat"/>
      <p>A chat feature for real-time communication among users.</p>
    </td>
  </tr>
  <tr>
    <td>
      <h3> Push Notifications </h3>
      <img src="https://github.com/tim200002/fingerfunke-app/assets/48860268/19016bc2-c95b-4e03-a82f-82b206db4336" alt="Push Notifications"/>
      <p>Notification system to keep users informed about important updates.</p>
    </td>
    <td>
      <!-- Placeholder for balancing the grid -->
    </td>
  </tr>
</table>




## Build Environment
If you build the App, please make sure you are using the following build environment
- Flutter 3.10.1
- Dart 3.0.1
- CocoaPods 1.10.1 (low version has to do with CI/CD pipeline)


## Getting started

### First Time Setup
The old way of downloading config files from google is deprecated. The new way is to use the `firebase CLI` as outlined [here](https://firebase.flutter.dev/docs/cli/). This has the advantage that you no longer have to deal with configuration files manually. 

The steps for using the `firebase CLI`are
1. If you do not already have the `firebase CLI`install it via `npm install -g firebase-tools`and login
2. Also install the `FlutterFireCLI` by running `dart pub global activate flutterfire_cli`
3. Once installed go to the root of this project, run `flutterfire configure` and follow the following steps
  - Select a firebase project -> select fingerfunke
  - Which platform should your configuration support -> select android and ios
  - In the next step the android app should be found automatically leading to the output `Firebase android app app.fingerfunke.fingerfunke registered.`
  - We are using a different name for the ios app, thus it is not found automatically. Thus, when prompted for `Which ios bundle id do you want to use for this configuration, e.g. 'com.example.app'?` enter the name `app.fingerfunke.fingerfunke-mobile-app`
  - Finally select `yes`to continue

After following these steps you must also make sure that you are using the right configuration. For more information on this please refer to the `Configuration Setup` section


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
The old process of copying `.env` files is obsolete. Instead you must make sure the [the private fingerfunke configuration repo](https://gitlab.com/fingerfunke/config-files) is cloned next to this repo. If this is the case, you can simply build the App for different environments using the provided run scripts in visual studio code (see `launch.json`).
If you want to run manually this is also possible, however, you must then provide the flag `flutter run --dart-define-from-file <path to the config.json>`. It is also possible to setup automatic build scripts like in vscode for android studio. For more information please refer to [this tutorial](https://itnext.io/secure-your-flutter-project-the-right-way-to-set-environment-variables-with-compile-time-variables-67c3163ff9f4).

#### Defining and Using New Environment Variables
**Dart Code**
To define a new environment variable, just add it to the proper `config.json` file in [the private fingerfunke configuration repo](https://gitlab.com/fingerfunke/config-files) which should be cloned next to this project (no manual copying required). The variable can then be accessed in the dart code using functions like ` String.fromEnvironment("EMULATOR_IP", defaultValue: "");`

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

Releases are named using [sematic versioning](https://semver.org/lang/de/) meaning, there are three different types of releases:

- Major release: A major release increments the first number. This is done when there are significant changes in the feature set of the App
- Minor Release: A minor release increments the second number. This is done when new functionality has been added to the App
- Patch release: A patch release increments the third number. This is done when only bugs have been fixed

## How to create a new release
To simplify the process of releasing, there is a [Tools](Repo)
