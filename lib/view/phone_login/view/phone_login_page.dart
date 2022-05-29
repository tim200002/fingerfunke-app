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
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: Stack(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              "assets/img/images/connected_hands.png",
              fit: BoxFit.cover,
              height: 1000,
              width: 1000,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedSize(
                    alignment: Alignment.bottomCenter,
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 1),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 220),
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: BlocProvider<PhoneLoginCubit>(
                        create: (BuildContext context) => PhoneLoginCubit(),
                        child: BlocBuilder<PhoneLoginCubit, PhoneLoginState>(
                          // only for rebuild between different screens therefore only when real class changes
                          buildWhen: (previousState, state) =>
                              previousState.runtimeType != state.runtimeType,
                          builder: (context, state) {
                            return state.map(
                                enterPhoneNumber: (_) =>
                                    const EnterPhoneNumberView(),
                                enterCode: (_) => EnterCodeView(),
                                authenticated: (_) =>
                                    const AuthenticatedView());
                          },
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ));
  }
}
