import 'package:flutter/material.dart';

import '../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../models/user/user.dart';

class ClearanceBuilder extends StatelessWidget {
  final UserClearance clearance;
  final Widget Function(User, UserClearance) builder;
  const ClearanceBuilder(
      {Key? key, required this.clearance, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FirebaseAuthenticationCubitCubit.userBuilder(
          (user) =>  user.hasClearance(clearance)
          ? builder.call(user, clearance)
          : Container(),
    );
  }
}
