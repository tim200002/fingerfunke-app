import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import 'app.dart';
import 'cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import 'cubits/live_config_cubit/live_config_cubit.dart';
import 'cubits/settings_cubit/app_settings_cubit.dart';
import 'env.dart' as env;
import 'models/settings/app_settings.dart';
import 'repositories/firebase_authentication_repository/firebase_authentication_repository.dart';
import 'repositories/storage_repository/storage_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await FlutterConfig.loadEnvVariables();
  await StorageRepositoryImpl().init();
  await Firebase.initializeApp();
  final Logger _logger = Logger();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // choose envrionment
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

  runApp(const AppInflater());
}

class AppInflater extends StatelessWidget {
  const AppInflater({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthenticationRepository firebaseAuthenticationRepository =
        FirebaseAuthenticationRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FirebaseAuthenticationCubitCubit(
              firebaseAuthenticationRepository),
        ),
        BlocProvider(
          create: (context) => AppSettingsCubit(),
        ),
        BlocProvider(
          create: (context) => LiveConfigCubit(),
        ),
      ],
      child: App(),
    );
  }
}
