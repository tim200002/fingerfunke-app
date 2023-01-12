import '../../../utils/tools.dart';
import '../cubit/phone_login_cubit.dart';
import 'enter_code_view.dart';
import 'enter_phone_number_view.dart';
import 'loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/illustration.dart';

class PhoneLoginPage extends StatelessWidget {
  const PhoneLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: Stack(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRect(
              child: Container(
                  padding: const EdgeInsets.only(bottom: 240),
                  color: Colors.grey.shade50,
                  child: Center(
                    child: Illustration(
                      Illustrations.dreamer,
                      width: 260,
                    ),
                  )),
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
                      constraints: const BoxConstraints(minHeight: 220),
                      padding: const EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: BlocProvider<PhoneLoginCubit>(
                        create: (BuildContext context) => PhoneLoginCubit(),
                        child: BlocConsumer<PhoneLoginCubit, PhoneLoginState>(
                          listener: ((context, state) => state.whenOrNull<void>(
                                  enterPhoneNumber: (message) {
                                if (message != null) {
                                  Tools.showSnackbar(context, message);
                                }
                              })),
                          // only for rebuild between different screens therefore only when real class changes
                          buildWhen: (previousState, state) =>
                              previousState.runtimeType != state.runtimeType,
                          builder: (context, state) {
                            return state.when(
                              enterPhoneNumber: (_) =>
                                  const EnterPhoneNumberView(),
                              waitForCodeSent: () =>
                                  LoadingView(l10n(context).msg_loginWaitCode),
                              enterCode: (verificationId, autoDet, __) =>
                                  EnterCodeView(verificationId, autoDet),
                              waitForLogIn: () =>
                                  LoadingView(l10n(context).msg_loginWait),
                            );
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
