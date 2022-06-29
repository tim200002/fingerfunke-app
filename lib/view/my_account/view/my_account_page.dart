import 'package:fingerfunke_app/cubits/app_cubit/app_cubit.dart';
import 'package:fingerfunke_app/utils/util_widgets/page_screen.dart';
import 'package:fingerfunke_app/view/my_account/profile_picture:image_upload/profile_picture_image_upload_widget.dart';
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
      body: ListView(
        children: const [
          _ProfileSection(),
          _AccountSection(),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final user = state.user;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  child: ProfilePictureImageUploadWidget()),
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
                  ],
                ),
              )
            ],
          ),
        );
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
