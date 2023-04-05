import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import 'cubits/settings_cubit/app_settings_cubit.dart';
import 'env.dart' as env;
import 'locator.dart';
import 'repositories/firebase_authentication_repository/firebase_authentication_repository.dart';
import 'repositories/storage_repository/storage_repository.dart';
import 'services/app_info_service.dart';
import 'services/meta_info_service.dart';
import 'services/notification_service.dart';
import 'services/session_info_service.dart';
import 'models/user/user.dart' as user_models;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupGetIt();

  // storage must be initialized async, therefore reads are sync afterwards
  await GetIt.I<StorageRepository>().init();
  await GetIt.I<AppInfoService>().init();

  final Logger _logger = Logger();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // choose environment
  switch (env.FIREBASE_ENVIRONMENT) {
    case 'local':
      {
        _logger.i("Using local environment");
        Logger.level = Level.debug;
        String? emulatorIp = env.EMULATOR_IP;
        if (emulatorIp == null) {
          _logger.e("No IP for Emulator provided, falling back to localhost ");
          emulatorIp = "localhost";
        }
        await FirebaseAuth.instance.useAuthEmulator(emulatorIp, 9099);
        FirebaseFirestore.instance.useFirestoreEmulator(emulatorIp, 8080);
        FirebaseFunctions.instanceFor(region: 'europe-west3')
            .useFunctionsEmulator(emulatorIp, 5001);
        break;
      }
    case 'production':
      {
        _logger.i("Using production environment");
        Logger.level = Level.verbose;
        break;
      }
    default:
      {
        _logger.e("An Environment must be provides either production or local");
        exit(1);
      }
  }

  runApp(AppInflater(
   
  ));
}

class AppInflater extends StatelessWidget {

  AppInflater({Key? key}) : super(key: key);

  /// This function handles all the functions that must be executed
  /// on login for proper user management etc.
  // ignore: prefer_function_declarations_over_variables
  final Future<void> Function(user_models.User) logInHandler = (user) async {
    // To make messaging work
    final fcmToken = await FirebaseMessaging.instance.getToken();
    await NotificationService.setFCMToken(user.id, fcmToken);

    // To keep track of sessions
    final PackageInfo packageInfo = GetIt.I<AppInfoService>().packageInfo;
    SessionInfoService.init(user.id);
    SessionInfoService.instance
        .setAppVersion("${packageInfo.version}+${packageInfo.buildNumber}");

    // To keep track of logins
    MetaInfoService.registerAppOpening();
  };

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FirebaseAuthenticationCubitCubit>(
            lazy: false,
            create: (_) => FirebaseAuthenticationCubitCubit(
                GetIt.I<FirebaseAuthenticationRepository>(), logInHandler)),
        BlocProvider(create: (_) => AppSettingsCubit()),
      ],
      child: const App(),
    );
  }
}
