import 'package:fingerfunke_app/utils/app_theme.dart';
import 'package:fingerfunke_app/view/phone_login/cubit/phone_login_cubit.dart';
import 'package:fingerfunke_app/view/phone_login/view/authenticated_view.dart';
import 'package:fingerfunke_app/view/phone_login/view/enter_code_view.dart';
import 'package:fingerfunke_app/view/phone_login/view/enter_phone_number_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneLoginPage extends StatelessWidget {
  const PhoneLoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const PhoneLoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppTheme.PADDING_SIDE,
              right: AppTheme.PADDING_SIDE,
              bottom: 50),
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Text("TODO: Illustration"),
                ),
              ),
              BlocProvider<PhoneLoginCubit>(
                create: (BuildContext context) => PhoneLoginCubit(),
                child: BlocBuilder<PhoneLoginCubit, PhoneLoginState>(
                  // only for rebuild between different screens therefore only when real class changes
                  buildWhen: (previousState, state) =>
                      previousState.runtimeType != state.runtimeType,
                  builder: (context, state) {
                    return state.map(
                        enterPhoneNumber: (_) => EnterPhoneNumberView(),
                        enterCode: (_) => EnterCodeView(),
                        authenticated: (_) => const AuthenticatedView());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
