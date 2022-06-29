import 'package:fingerfunke_app/cubits/app_cubit/app_cubit.dart';
import 'package:fingerfunke_app/cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import 'package:fingerfunke_app/routes.dart';
import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/view/create_account/view/create_account_view.dart';
import 'package:fingerfunke_app/view/home/view/home_view.dart';
import 'package:fingerfunke_app/view/splash/view/splash_page.dart';
import 'package:fingerfunke_app/view/welcome/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final ThemeMode themeMode;
  const App(this.themeMode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: BlocBuilder<FirebaseAuthenticationCubitCubit,
          FirebaseAuthenticationCubitState>(
        builder: (context, state) => state.when(
          unauthenticated: () =>
              buildApp(const WelcomePage(), themeMode: themeMode),
          authenticatedWaitingForUserToBeFetched: (_) =>
              buildApp(const SplashPage(), themeMode: themeMode),
          autehnticationNoUserCreated: (uid) =>
              buildApp(const CreateAccountView(), themeMode: themeMode),
          authenticated: (user) => BlocProvider(
            create: (context) => AppCubit(user),
            child: buildApp(const HomeView(),
                themeMode: themeMode, routes: routes),
          ),
        ),
      ),
    );
  }

  Widget buildApp(Widget home,
      {ThemeMode? themeMode,
      Map<String, Widget Function(BuildContext)> routes =
          const <String, WidgetBuilder>{}}) {
    return MaterialApp(
      routes: routes,
      theme: AppTheme.mainTheme,
      //darkTheme: AppTheme.darkTheme,
      themeMode: themeMode, //TODO change back to themeMode
      debugShowCheckedModeBanner: false,
      home: home,
    );
  }
}
