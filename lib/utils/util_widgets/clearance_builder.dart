import 'package:fingerfunke_app/cubits/app_cubit/app_cubit.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearanceBuilder extends StatelessWidget {
  final ClearanceLevel level;
  final Widget Function(User) builder;
  const ClearanceBuilder({Key? key, required this.level, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => state.user.hasClearance(User.clearanceAdmin)
          ? builder.call(state.user)
          : Container(),
    );
  }
}
