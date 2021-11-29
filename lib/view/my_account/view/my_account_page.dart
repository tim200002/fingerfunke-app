import 'package:fingerfunke_app/common_widgets/image/user_image/user_image.dart';
import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/util_widgets/page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

const _settingsTitlePadding = EdgeInsets.only(
  top: 20,
  left: 15.0,
  right: 15.0,
  bottom: 6.0,
);

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScreen(
      appBar: AppBar(
        title: const Text("Mein Account"),
      ),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) => state.maybeWhen(
            signedIn: (_) => Column(
                  children: const [
                    TopBar(),
                    TopList(),
                    BottomList(),
                    DevelopementList()
                  ],
                ),
            signedInAnonymously: () => Column(
                  children: const [TopList()],
                ),
            orElse: () => ErrorWidget(InvalidStateException())),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  static const double userImageSize = 80;
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return state.maybeWhen(
            signedIn: (user) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox.square(
                        dimension: userImageSize,
                        child: Stack(
                          //fit: StackFit.passthrough,
                          children: [
                            UserImage(
                              user.picture,
                              diameter: userImageSize.round(),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: Colors.white.withAlpha(200),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(Icons.edit, size: 20)))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Text(
                          user.name,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      )
                    ],
                  ),
                ),
            orElse: () => ErrorWidget(InvalidStateException()));
      },
    );
  }
}

class BottomList extends StatelessWidget {
  const BottomList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: "Informationen",
      titlePadding: _settingsTitlePadding,
      tiles: [
        SettingsTile(
            title: "Datenschutz",
            leading: const Icon(Icons.privacy_tip_outlined),
            onPressed: (context) {}),
        SettingsTile(
            title: "Impressum",
            leading: const Icon(Icons.notes_rounded),
            onPressed: (context) {}),
        SettingsTile(
            title: "Lizenzen",
            leading: const Icon(Icons.gavel_outlined),
            onPressed: (context) {}),
      ],
    );
  }
}

class TopList extends StatelessWidget {
  const TopList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: "Account",
      titlePadding: _settingsTitlePadding,
      tiles: [
        SettingsTile(
            title: "SocialMedia",
            leading: const Icon(Icons.link_rounded),
            onPressed: (context) {}),
        SettingsTile(
          title: "Account verwalten",
          leading: const Icon(Icons.account_circle_outlined),
          onPressed: (context) {
            Navigator.of(context).pushNamed("/manageAccount");
          },
        ),
      ],
    );
  }
}

class DevelopementList extends StatelessWidget {
  const DevelopementList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      titlePadding: _settingsTitlePadding,
      title: "Entwicklung",
      tiles: [
        SettingsTile(
          title: "Developement utils",
          leading: const Icon(Icons.code_rounded),
          onPressed: (context) {
            Navigator.of(context).pushNamed("/developementUtils");
          },
        ),
      ],
    );
  }
}

/*class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const Icon(Icons.arrow_right)
        ],
      ),
    );
  }
}*/
