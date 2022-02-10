import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:fingerfunke_app/view/create_account/view/cubit/create_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateAccountView());
  }

  @override
  Widget build(BuildContext context) {
    final authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<CreateAccountCubit>(
        create: (context) => CreateAccountCubit(
            userId: authenticationCubit.state.maybeWhen(
          signedInButNoUserDocumentCreated: (userId) => userId,
          orElse: () => throw InvalidStateException(),
        )),
        child: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Hi",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                Text(
                  "um zu starten brauchen wir deinen Namen.\nGerne darfst du auch ein Profilbild hochladen, damit andere dich besser erkennen",
                  style: Theme.of(context).textTheme.headline6,
                ),
                TextField(
                  onChanged: (value) =>
                      BlocProvider.of<CreateAccountCubit>(context)
                          .onUpdateUserName(value),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<CreateAccountCubit, CreateAccountState>(
                      builder: (context, state) => OutlinedButton(
                        onPressed: state.inputValid
                            ? () => BlocProvider.of<CreateAccountCubit>(context)
                                .createUser()
                                .then(
                                    (_) => authenticationCubit.forceNewState())
                            : null,
                        child: const Text("Los gehts"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
