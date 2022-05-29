import 'package:fingerfunke_app/common_widgets/image/user_image/user_image.dart';
import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/utils/util_widgets/floating_modal.dart';
import 'package:fingerfunke_app/utils/util_widgets/page_screen.dart';
import 'package:fingerfunke_app/view/image_upload/view/image_upload_modal_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '../../app_info/app_info_page.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScreen(
      appBar: AppBar(
          title: const Text("Mein Account"),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close))),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) => state.maybeWhen(
            signedIn: (_) => ListView(
                  children: const [
                    _ProfileSection(),
                    _AccountSection(),
                  ],
                ),
            signedInAnonymously: () => ListView(
                  children: const [
                    _AccountSection(),
                  ],
                ),
            orElse: () => ErrorWidget(InvalidStateException())),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  static const double userImageSize = 65;
  const _ProfileSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return state.maybeWhen(
            signedIn: (user) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: InkWell(
                          onTap: () => showFloatingModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  const ImageUploadModalContent()),
                          child: SizedBox.square(
                            dimension: userImageSize,
                            child: Stack(
                              //fit: StackFit.passthrough,
                              children: [
                                UserImage(
                                  user.picture?.downloadUrl,
                                  diameter: userImageSize.round(),
                                ),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            color: Colors.white.withAlpha(200),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child:
                                            const Icon(Icons.edit, size: 20)))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: Text(
                                  user.name,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ),
                              const Text(
                                  //ToDo: Show the user's real phone number
                                  "+49 123 456 7890"),
                            ]),
                      )
                    ],
                  ),
                ),
            orElse: () => ErrorWidget(InvalidStateException()));
      },
    );
  }
}

class _AccountSection extends StatelessWidget {
  const _AccountSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FFSettingsSection(
      title: "Account",
      tiles: [
        SettingsTile(
            title: "SocialMedia",
            leading: const Icon(Icons.link_rounded),
            enabled: false,
            onPressed: null),
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
