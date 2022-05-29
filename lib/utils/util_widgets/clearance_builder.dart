import 'package:fingerfunke_app/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/authentication_cubit/authentication_cubit.dart';

class ClearanceBuilder extends StatelessWidget {
  final ClearanceLevel level;
  final Widget Function(User) builder;
  const ClearanceBuilder({Key? key, required this.level, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) => state.maybeWhen(
              orElse: () => Container(),
              signedIn: (user) => user.hasClearance(User.clearanceAdmin)
                  ? builder.call(user)
                  : Container(),
            ));
  }
}
