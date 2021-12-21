import 'package:fingerfunke_app/app.dart';
import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/cubits/settings_cubit/settings_cubit.dart';
import 'package:fingerfunke_app/repositories/settings_repository/settings_repository.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/view/create_account/view/create_account_view.dart';
import 'package:fingerfunke_app/view/splash/view/splash_page.dart';
import 'package:fingerfunke_app/view/unauthenticated/view/unauthenticated_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  Logger.level = Level.verbose;
  runApp(AppInflater());
}

class AppInflater extends StatelessWidget {
  AppInflater({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  void mapStateChangeToNavigationEvent(AuthenticationState state) {
    state.whenOrNull(
      unauthenticated: () {
        _navigator.currentState!
            .pushAndRemoveUntil(UnauthenticatedPage.route(), (_) => false);
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(SettingsRepositoryImpl()),
        ),
      ],
      child: BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context, state) {
          BlocProvider.of<SettingsCubit>(context).loadSettings();
          return Builder(
            builder: (context) {
              BlocProvider.of<AuthenticationCubit>(context)
                  .connectListener(mapStateChangeToNavigationEvent);

              return state.when(
                  initial: () {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: buildLoadedApp(context, _navigator, ThemeMode.system),
                );
              }, loaded: (settings) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: buildLoadedApp(context, _navigator, settings.themeMode),
                );
              });
            },
          );
        }
      ),
    );
  }
}

Widget buildLoadedApp(context, _navigator, themeMode) {
  return MaterialApp(
    routes: routes,
    navigatorKey: _navigator,

    theme: AppTheme.mainTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: themeMode,
    debugShowCheckedModeBanner: false,
    onGenerateRoute: (_) => SplashPage.route(),
  );
}
