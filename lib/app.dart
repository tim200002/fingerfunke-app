import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cubits/app_cubit/app_cubit.dart';
import 'cubits/app_info/app_info_cubit.dart';
import 'cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import 'cubits/settings_cubit/app_settings_cubit.dart';
import 'models/settings/app_settings.dart';
import 'routes.dart';
import 'services/meta_info_service.dart';
import 'services/session_info_service.dart';
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
        builder: (context, state) => state.when(
            unauthenticated: () => buildApp(const WelcomePage(
                  betaMessage: "beta@Erlangen",
                )),
            authenticatedWaitingForUserToBeFetched: (_) =>
                buildApp(const SplashPage()),
            autehnticationNoUserCreated: (uid) =>
                buildApp(const CreateAccountView()),
            authenticated: (user) {
              AppCubit.setUserVars(user.id);
              SessionInfoService.init(user.id);
              SessionInfoService.instance
                  .setAppVersion(context.read<AppInfoCubit>().versionString);
              SessionInfoService.instance
                  .setLocale(context.read<AppSettingsCubit>().state.locale);

              MetaInfoService.registerAppOpening();
              return BlocProvider(
                create: (context) => AppCubit(user),
                child: buildApp(const BaseView(), routes: routes),
              );
            }),
      ),
    );
  }

  Widget buildApp(Widget home,
      {Map<String, Widget Function(BuildContext)> routes =
          const <String, WidgetBuilder>{}}) {
    return BlocBuilder<AppSettingsCubit, AppSettings>(
        builder: (context, settings) => MaterialApp(
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
            ));
  }
}
