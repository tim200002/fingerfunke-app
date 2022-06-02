import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:fingerfunke_app/app.dart';
import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/cubits/live_config_cubit/live_config_cubit.dart';
import 'package:fingerfunke_app/cubits/settings_cubit/settings_cubit.dart';
import 'package:fingerfunke_app/repositories/settings_repository/settings_repository.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/services/authentication/authentication_service.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/view/create_account/view/create_account_view.dart';
import 'package:fingerfunke_app/view/splash/view/splash_page.dart';
import 'package:fingerfunke_app/view/welcome/view/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  final Logger _logger = Logger();

  // choose envrionment
  switch (dotenv.env['FIREBASE_ENVIRONMENT']) {
    case 'local':
      {
        _logger.i("Using local environment");
        Logger.level = Level.debug;
        String? emulatorIp = dotenv.env['EMULATOR_IP'];
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

  runApp(AppInflater());
}

class AppInflater extends StatelessWidget {
  AppInflater({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  void mapStateChangeToNavigationEvent(AuthenticationState state) {
    state.whenOrNull(
      unauthenticated: () {
        _navigator.currentState!
            .pushAndRemoveUntil(WelcomePage.route(), (_) => false);
      },
      signedInAnonymously: () {
        _navigator.currentState!.pushAndRemoveUntil(App.route(), (_) => false);
      },
      signedIn: (_) => _navigator.currentState!
          .pushAndRemoveUntil(App.route(), (_) => false),
      signedInButNoUserDocumentCreated: (_) {
        _navigator.currentState!
            .pushAndRemoveUntil(CreateAccountView.route(), (_) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationService authService = AuthenticationService();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit()
            // here to keep the Authentication Service always up to date with the cubit
            // cubit is always source of truth
            ..connectListener((authState) =>
                authService.onAuthenticationStateChanged(authState)),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(SettingsRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => LiveConfigCubit(),
        ),
      ],
      child:
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
        BlocProvider.of<SettingsCubit>(context).loadSettings();
        return Builder(
          builder: (context) {
            BlocProvider.of<AuthenticationCubit>(context)
                .connectListener(mapStateChangeToNavigationEvent);

            return state.when(initial: () {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                //ToDo: select light mode by default, as dark mode has some testing issues
                child: buildLoadedApp(
                    context, _navigator, ThemeMode.light), //ThemeMode.system),
              );
            }, loaded: (settings) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: buildLoadedApp(context, _navigator, settings.themeMode),
              );
            });
          },
        );
      }),
    );
  }
}

Widget buildLoadedApp(context, _navigator, themeMode) {
  return MaterialApp(
    routes: routes,
    navigatorKey: _navigator,
    theme: AppTheme.mainTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: ThemeMode.light, //TODO change back to themeMode
    debugShowCheckedModeBanner: false,
    onGenerateRoute: (_) => SplashPage.route(),
  );
}
