import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/view/create_account/view/cubit/create_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateAccountView());
  }

  @override
  Widget build(BuildContext context) {
    final authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    return Container(
      color: Colors.white,
      child: BlocProvider<CreateAccountCubit>(
        create: (context) => CreateAccountCubit(
            userId: authenticationCubit.state.maybeWhen(
          signedInButNoUserDocumentCreated: (userId) => userId,
          signedIn: (user) => user.id,
          orElse: () => throw InvalidStateException(),
        )),
        child: Scaffold(
          backgroundColor:
              Theme.of(context).colorScheme.secondary.withOpacity(0.4),
          body: Builder(
            builder: (context) => Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                //margin: EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Willkommen!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    const Text(
                      "Wie sollen Dich andere Nutzer nennen?",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w900),
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "z.B. Julia",
                          border: InputBorder.none),
                      onChanged: (value) =>
                          BlocProvider.of<CreateAccountCubit>(context)
                              .onUpdateUserName(value),
                    ),
                    const SizedBox(height: 60)
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton:
              BlocBuilder<CreateAccountCubit, CreateAccountState>(
            builder: (context, state) => FloatingActionButton(
              child: Icon(FeatherIcons.check),
              onPressed: state.inputValid
                  ? () => BlocProvider.of<CreateAccountCubit>(context)
                      .createUser()
                      .then((_) => authenticationCubit.forceNewState())
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
