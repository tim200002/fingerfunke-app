import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/app_cubit/app_cubit.dart';
import '../../models/user/user.dart';

class ClearanceBuilder extends StatelessWidget {
  final UserClearance clearance;
  final Widget Function(User, UserClearance) builder;
  const ClearanceBuilder(
      {Key? key, required this.clearance, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => state.user.hasClearance(clearance)
          ? builder.call(state.user, clearance)
          : Container(),
    );
  }
}
