import 'package:fingerfunke_app/cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateAccountView());
  }

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final TextEditingController _userNameController = TextEditingController();
  bool _isSendButtonActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
      body: Builder(
        builder: (context) => Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            //margin: EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Willkommen!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                const Text(
                  "Wie sollen Dich andere Nutzer nennen?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _userNameController,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w900),
                  decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "z.B. Julia",
                      border: InputBorder.none),
                ),
                const SizedBox(height: 60)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FeatherIcons.check),
        onPressed: _isSendButtonActive
            ? () async {
                setState(() {
                  _isSendButtonActive = false;
                });
                await BlocProvider.of<FirebaseAuthenticationCubitCubit>(context)
                    .createUserDocument(name: _userNameController.text);
                setState(() {
                  _isSendButtonActive = true;
                });
              }
            : null,
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }
}
