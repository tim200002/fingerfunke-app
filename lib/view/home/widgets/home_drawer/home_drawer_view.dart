import 'package:fingerfunke_app/common_widgets/image/user_image/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../cubits/authentication_cubit/authentication_cubit.dart';
import '../../../../models/user/user.dart';
import '../../../../routes.dart';
import '../../../../utils/exceptions.dart';

part './profile_section.dart';

class HomeDrawer extends StatelessWidget {
  static const _borderRadius = Radius.circular(40);
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
                onTap: () {},
              ),
              const SizedBox(
                height: 25,
              ),
              ListTile(
                leading: const Icon(FeatherIcons.settings),
                title: const Text('Einstellungen'),
                onTap: () => {},
              ),
              ListTile(
                leading: const Icon(FeatherIcons.share2),
                title: const Text('Social Media'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: const Icon(FeatherIcons.info),
                title: const Text('Informationen'),
                onTap: () => {Navigator.of(context).pop()},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
