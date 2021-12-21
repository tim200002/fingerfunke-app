import 'package:fingerfunke_app/app.dart';
import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
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
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: Builder(
        builder: (context) {
          BlocProvider.of<AuthenticationCubit>(context)
              .connectListener(mapStateChangeToNavigationEvent);
          return MaterialApp(
            routes: routes,
            navigatorKey: _navigator,
            theme: AppTheme.mainTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (_) => SplashPage.route(),
          );
        },
      ),
    );
  }
}
