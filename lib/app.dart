import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import 'cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import 'cubits/live_config_cubit/live_config_cubit.dart';
import 'cubits/location_cubit/location_cubit.dart';
import 'cubits/notification_tracker/notification_tracker.dart';
import 'cubits/settings_cubit/app_settings_cubit.dart';
import 'models/settings/app_settings.dart';
import 'routes.dart';
import 'services/globals_service.dart';
import 'utils/app_theme.dart';
import 'view/create_account/view/create_account_view.dart';
import 'view/main/base_view.dart';
import 'view/splash/view/splash_page.dart';
import 'view/welcome/view/welcome_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: BlocBuilder<FirebaseAuthenticationCubitCubit,
          FirebaseAuthenticationCubitState>(
        // Only update on runtime state changes not on updates within a user
        buildWhen: ((previous, current) =>
            previous.runtimeType != current.runtimeType),
        builder: (context, state) => state.when(
          unauthenticated: () => buildApp(const WelcomePage(
            useStaticTestphaseWall: true,
            betaMessage: "beta@Erlangen",
          )),
          authenticatedWaitingForUserToBeFetched: (_) =>
              buildApp(const SplashPage()),
          autehnticationNoUserCreated: (uid) =>
              buildApp(const CreateAccountView()),
          authenticated: (user) {
            // provided all relevant blocks that are necessary to fully use the app
            return MultiBlocProvider(providers: [
              BlocProvider(create: (_) => LiveConfigCubit()),
              BlocProvider(create: (_) => LocationCubit()),
              BlocProvider(create: (_) => NotificationTracker(user.id)),
            ], child: buildApp(const BaseView(), routes: routes));
          },
        ),
      ),
    );
  }

  Widget buildApp(Widget home,
      {Map<String, Widget Function(BuildContext)> routes =
          const <String, WidgetBuilder>{}}) {
    return BlocBuilder<AppSettingsCubit, AppSettings>(
      builder: (context, settings) => MaterialApp(
        scaffoldMessengerKey:
            GetIt.I<GlobalsService>().rootScaffoldMessengerKey,
        routes: routes,
        locale: settings.locale == "system"
            ? null
            : Locale(settings.locale.split("_").first),
        theme: AppTheme.mainTheme,
        darkTheme: AppTheme.darkTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        //darkTheme: AppTheme.darkTheme,
        themeMode: settings.themeMode,
        debugShowCheckedModeBanner: false,
        home: home,
      ),
    );
  }
}
