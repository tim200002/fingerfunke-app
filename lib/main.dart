import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import 'app.dart';
import 'cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import 'cubits/live_config_cubit/live_config_cubit.dart';
import 'cubits/settings_cubit/settings_cubit.dart';
import 'models/settings/settings_model.dart'
    as settings;
import 'repositories/firebase_authentication_repository/firebase_authentication_repository.dart';
import 'repositories/settings_repository/settings_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await GetStorage.init();
  await Firebase.initializeApp();
  final Logger _logger = Logger();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // choose envrionment
  switch (FlutterConfig.get('FIREBASE_ENVIRONMENT')) {
    case 'local':
      {
        _logger.i("Using local environment");
        Logger.level = Level.debug;
        String? emulatorIp = FlutterConfig.get('EMULATOR_IP');
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
          create: (context) => SettingsCubit(SettingsRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => LiveConfigCubit(),
        ),
      ],
      child: BlocBuilder<SettingsCubit, settings.Settings>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: App(state.themeMode),
          );
        },
      ),
    );
  }
}
