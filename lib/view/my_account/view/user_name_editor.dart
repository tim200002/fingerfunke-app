import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../models/user/user.dart';
import '../../../repositories/user_repository/user_repository.dart';
import '../../../utils/tools.dart';

class UserNameEditor extends StatelessWidget {
  const UserNameEditor({super.key});

  void _showEditDialog(BuildContext context, User user) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => _EditingDialogue(user));
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAuthenticationCubitCubit.userBuilder(
      (user) => InkWell(
          onTap: () => _showEditDialog(context, user), child: Text(user.name, style: Theme.of(context).textTheme.headline5,)),
    );
  }
}

class _EditingDialogue extends StatefulWidget {
  final User user;
  final UserRepository userRepository = GetIt.I<UserRepository>();
  _EditingDialogue(this.user, {super.key});

  @override
  State<_EditingDialogue> createState() => _EditingDialogueState();
}

class _EditingDialogueState extends State<_EditingDialogue> {
  final TextEditingController userNameController = TextEditingController();
  bool isInputValid = true; // an initial name must always be valid

  void validateUserName() {
    String text = userNameController.text.trim();
    setState(() {
      isInputValid = text.isNotEmpty;
    });
  }

  @override
  void initState() {
    userNameController.text = widget.user.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "name", // ToDo: l10n(context).lbl_userName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: TextField(
                maxLength: 20,
                maxLines: 1,
                controller: userNameController,
                /*style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),*/
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  border: InputBorder.none,
                ),
                onChanged: ((value) => validateUserName()),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: isInputValid ? () {
                String value = userNameController.text.trim();
                widget.userRepository.updateUser(widget.user.id, name: value);
                Navigator.of(context).pop();
              } : null,
              child: Text(l10n(context).lbl_save),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }
}
