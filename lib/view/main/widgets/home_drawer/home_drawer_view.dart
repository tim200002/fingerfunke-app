import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../../../common_widgets/image/user_image/user_image.dart';
import '../../../../../../models/user/user.dart';
import '../../../../../../routes.dart';
import '../../../../../../utils/beta_indicator.dart';
import '../../../../../../utils/tools.dart';
import '../../../../../../utils/util_widgets/clearance_builder.dart';
import '../../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../../utils/util_widgets/floating_modal.dart';

part './profile_section.dart';

class HomeDrawer extends StatelessWidget {
  static const _borderRadius = Radius.circular(27);
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderShape =
        BorderRadius.only(topRight: _borderRadius, bottomRight: _borderRadius);
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: borderShape),
        child: ClipRRect(
          borderRadius: borderShape,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const _ProfileSection(),
                    //TODO: reenable once groups become available
                    /*const SizedBox(height: 15),
                    ListTile(
                      leading: const Icon(FeatherIcons.users),
                      title: Text(l10n(context).lbl_groups),
                      enabled: false,
                      onTap: () => DevTools.showToDoSnackbar(context),
                    ),
                    const SizedBox(height: 25),*/

                    ListTile(
                      leading: const Icon(FeatherIcons.bookmark),
                      title: Text(l10n(context).lbl_saved),
                      onTap: () =>
                          Navigator.of(context).pushNamed(Routes.saved),
                    ),
                    const SizedBox(height: 25),
                    ListTile(
                      leading: const Icon(FeatherIcons.info),
                      title: Text(l10n(context).lbl_information),
                      onTap: () =>
                          Navigator.of(context).pushNamed(Routes.about),
                    ),
                    ListTile(
                        leading: const Icon(FeatherIcons.share2),
                        title: Text(l10n(context).lbl_socialMedia),
                        onTap: () => _showOurSocialMediaModal(context)),

                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: BetaIndicator(message: "beta@Erlangen")),
                    ),
                    ClearanceBuilder(
                      clearance: UserClearance.development,
                      builder: (_, c) => ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(15))),
                        leading: const Icon(FeatherIcons.penTool),
                        title: Text(l10n(context).lbl_devTools),
                        tileColor: c.color.shade100,
                        onTap: () =>
                            Navigator.of(context).pushNamed(Routes.devtools),
                      ),
                    ),
                    ClearanceBuilder(
                      clearance: UserClearance.moderation,
                      builder: (_, c) => ListTile(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(15))),
                        tileColor: c.color.shade100,
                        leading: const Icon(FeatherIcons.shield),
                        title: Text(l10n(context).lbl_moderation),
                        onTap: () =>
                            Navigator.of(context).pushNamed(Routes.moderation),
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: const Icon(FeatherIcons.settings),
                      title: Text(l10n(context).lbl_settings),
                      onTap: () => Navigator.of(context)
                          .popAndPushNamed(Routes.settings),
                    ),
                    /*ListTile(
                      leading: const Icon(FeatherIcons.logOut),
                      title: Text(l10n(context).lbl_signOut),
                      enabled: true,
                      onTap: () =>
                          BlocProvider.of<FirebaseAuthenticationCubitCubit>(
                                  context)
                              .logoutRequested()
                              .catchError(
                                (_) => Tools.showSnackbar(
                                    context, l10n(context).msg_signOutFailed),
                              ),
                    ),*/
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  _showOurSocialMediaModal(BuildContext context) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
    showFloatingModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (String media in ["Instagram", "Twitter"])
                  TextButton(
                      onPressed: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                        launchUrlString(
                            "https://${media.toLowerCase()}.com/fingerfunke",
                            mode: LaunchMode.externalApplication);
                      },
                      child: Text(l10n(context).lbl_appSocialMedia(media)))
              ],
            ));
  }
}
