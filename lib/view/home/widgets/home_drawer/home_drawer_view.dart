import 'package:fingerfunke_app/common_widgets/image/user_image/user_image.dart';
import 'package:fingerfunke_app/cubits/app_cubit/app_cubit.dart';
import 'package:fingerfunke_app/utils/dev_tools.dart';
import 'package:fingerfunke_app/utils/util_widgets/clearance_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../cubits/authentication_cubit/authentication_cubit.dart';
import '../../../../models/user/user.dart';
import '../../../../routes.dart';
import '../../../../utils/exceptions.dart';

part './profile_section.dart';

class HomeDrawer extends StatelessWidget {
  static const _borderRadius = Radius.circular(40);
  const HomeDrawer({Key? key}) : super(key: key);

  Widget _moderationItem(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => state.user.hasClearance(User.clearanceAdmin)
          ? ListTile(
              leading: const Icon(FeatherIcons.monitor),
              title: const Text('Moderation'),
              onTap: () => Navigator.of(context).pushNamed(Routes.devtools),
            )
          : Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const borderShape =
        BorderRadius.only(topRight: _borderRadius, bottomRight: _borderRadius);
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: borderShape),
        child: ClipRRect(
          borderRadius: borderShape,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const _ProfileSection(),
              const SizedBox(
                height: 6,
              ),
              ListTile(
                leading: const Icon(FeatherIcons.users),
                title: const Text('Gruppen'),
                enabled: false,
                onTap: () => DevTools.showToDoSnackbar(context),
              ),
              const SizedBox(height: 25),
              ListTile(
                leading: const Icon(FeatherIcons.settings),
                title: const Text('Einstellungen'),
                enabled: false,
                onTap: () =>
                    Navigator.of(context).popAndPushNamed(Routes.settings),
              ),
              ListTile(
                leading: const Icon(FeatherIcons.share2),
                title: const Text('Social Media'),
                onTap: () => launch("https://instagram.com/fingerfunke"),
              ),
              ListTile(
                leading: const Icon(FeatherIcons.info),
                title: const Text('Informationen'),
                onTap: () => Navigator.of(context).pushNamed(Routes.about),
              ),
              const SizedBox(height: 25),
              ClearanceBuilder(
                level: User.clearanceAdmin,
                builder: (_) => ListTile(
                  leading: const Icon(FeatherIcons.penTool),
                  title: const Text('DevTools'),
                  onTap: () => Navigator.of(context).pushNamed(Routes.devtools),
                ),
              ),
              ClearanceBuilder(
                level: User.clearanceAdmin,
                builder: (_) => ListTile(
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(15))),
                  tileColor: Colors.orange.shade100,
                  leading: const Icon(FeatherIcons.shield),
                  title: const Text('Moderation'),
                  onTap: () =>
                      Navigator.of(context).pushNamed(Routes.moderation),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
