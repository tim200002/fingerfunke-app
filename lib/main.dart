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
import 'cubits/app_info/app_info_cubit.dart';
import 'cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import 'cubits/live_config_cubit/live_config_cubit.dart';
import 'cubits/location_cubit/location_cubit.dart';
import 'cubits/settings_cubit/app_settings_cubit.dart';
import 'env.dart' as env;
import 'locator.dart';
import 'repositories/firebase_authentication_repository/firebase_authentication_repository.dart';
import 'repositories/storage_repository/storage_repository.dart';
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
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
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

  runApp(AppInflater(packageInfo: packageInfo));
}

class AppInflater extends StatelessWidget {
  final PackageInfo packageInfo;

  /// This function handles all the functions that must be executed
  /// on login for proper user management etc.
  // ignore: prefer_function_declarations_over_variables
  final Future<void> Function(user_models.User, PackageInfo) logInHandler = (user, packageInfo) async {
    // To make messaging work
    final fcmToken = await FirebaseMessaging.instance.getToken();
    await NotificationService.setFCMToken(user.id, fcmToken);

    // To keep track of sessions
    SessionInfoService.init(user.id);
    SessionInfoService.instance
        .setAppVersion("${packageInfo.version}+${packageInfo.buildNumber}");

    // To keep track of logins
    MetaInfoService.registerAppOpening();
  };

  AppInflater({Key? key, required this.packageInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthenticationRepository authRep =
        FirebaseAuthenticationRepository();

    return
        // provide all blocs to the app
        MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppSettingsCubit()),
        BlocProvider(create: (_) => LiveConfigCubit()),
        BlocProvider(create: (_) => AppInfoCubit(packageInfo)),
        BlocProvider(
            lazy: false,
            create: (_) =>
                FirebaseAuthenticationCubitCubit(authRep, logInHandler)),
        BlocProvider(
          create: (_) => LocationCubit(),
        )
      ],
      child: const App(),
    );
  }
}
