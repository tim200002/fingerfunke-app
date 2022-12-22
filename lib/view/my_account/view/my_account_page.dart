import '../../../cubits/app_cubit/app_cubit.dart';
import '../../../routes.dart';
import '../../../utils/tools.dart';
import '../../../utils/util_widgets/page_screen.dart';
import '../../user_bio/user_bio_editor.dart';
import '../profile_picture_image_upload/profile_picture_image_upload_widget.dart';
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
          title: Text(l10n(context).lbl_myAccount),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close))),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: const [
                _ProfileSection(),
                SizedBox(height: 20),
                UserBioEditor(),
              ],
            ),
          ),
          const _AccountSection(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
            padding: EdgeInsets.only(right: 20),
            child: ProfilePictureImageUploadWidget()),
        BlocBuilder<AppCubit, AppState>(
          buildWhen: (previous, current) =>
              previous.user.name != current.user.name,
          builder: (context, state) => Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  state.user.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                /*const SizedBox(height: 7),
                  const Text(
                      //ToDo: Show the user's real phone number
                      "+49 123 456 7890"),*/
              ],
            ),
          ),
        ),
      ],
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
      title: l10n(context).lbl_account,
      tiles: [
        SettingsTile(
            title: l10n(context).lbl_linkSocialMedia,
            leading: const Icon(Icons.link_rounded),
            onPressed: (c) =>
                Navigator.of(c).pushNamed(Routes.linkSocialMedia)),
        SettingsTile(
            title: l10n(context).lbl_accountManage,
            leading: const Icon(Icons.account_circle_outlined),
            onPressed: (c) => Navigator.of(c).pushNamed(Routes.manageAccount)),
      ],
    );
  }
}
