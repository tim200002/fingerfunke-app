import 'cubits/app_cubit/app_cubit.dart';
import 'cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import 'routes.dart';
import 'utils/app_theme.dart';
import 'view/create_account/view/create_account_view.dart';
import 'view/home/view/home_view.dart';
import 'view/splash/view/splash_page.dart';
import 'view/welcome/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    //print('${bloc.runtimeType} $change');
  }
}

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
            authenticated: (user) => BlocOverrides.runZoned(
                () => BlocProvider(
                      create: (context) => AppCubit(user),
                      child: buildApp(const HomeView(),
                          themeMode: themeMode, routes: routes),
                    ),
                blocObserver: SimpleBlocObserver())),
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      //darkTheme: AppTheme.darkTheme,
      themeMode: themeMode, //TODO change back to themeMode
      debugShowCheckedModeBanner: false,
      home: home,
    );
  }
}
