import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../models/user/user.dart';
import '../../repositories/user_repository/user_repository.dart';
import '../../utils/skeleton_view.dart';
import '../../utils/type_aliases.dart';
import '../../view/user_profile/profile_view.dart';
import '../image/user_image/user_image.dart';

class UserInfoView extends StatefulWidget {
  final FirestoreId _userId;
  final Color? color;
  final bool vertical;
  final bool compact;
  final EdgeInsets margin;

  late final UserRepository _userRepository;
  final GetIt _getIt = GetIt.instance;

  UserInfoView(this._userId,
      {super.key,
      this.color,
      this.vertical = false,
      this.compact = false,
      this.margin = EdgeInsets.zero}) {
    _userRepository = _getIt<UserRepository>();
  }

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  User? _user;
  @override
  void initState() {
    // load user from cache or repository
    widget._userRepository.getUser(widget._userId).then((value) {
      setState(() {
        // ToDo: can we find a better solution that can handle the case that the user is deleted and thus a null value is returned?
        if (value == null) {
          throw Exception(
              "PLease use this widget only if it can be guaranteed that for the given ID a user exists");
        }
        _user = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // only make the user profile view clickable once the user is loaded
      onTap: _user != null
          ? () => UserProfileView.showAsBottomSheet(context, user: _user!)
          : null,
      child: Padding(
        padding: widget.margin,
        child: widget.vertical
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UserImage(
                    _user?.picture,
                    diameter: 50,
                  ),
                  const SizedBox(height: 10),
                  _user != null
                      ? Text(
                          _user!.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: widget.color,
                                  fontWeight: FontWeight.bold),
                        )
                      : SkeletonView.shimmer(const SkeletonView.text()),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserImage(
                    _user?.picture,
                    diameter: widget.compact ? 24 : 34,
                  ),
                  SizedBox(width: widget.compact ? 6 : 15),
                  _user != null
                      ? Text(
                          _user!.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: widget.color),
                        )
                      : SkeletonView.shimmer(const SkeletonView.text())
                ],
              ),
      ),
    );
  }
}
