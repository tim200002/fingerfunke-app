import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../cubits/firebase_authentication_cubit/firebase_authentication_cubit_cubit.dart';
import '../../../models/user/user.dart';
import '../../../repositories/user_repository/user_repository.dart';
import '../../../utils/tools.dart';


class UserBioEditor extends StatelessWidget {
  final UserRepository userRepository = GetIt.I<UserRepository>();

  UserBioEditor({super.key});

  void _showEditDialog(BuildContext context, User user) {
    TextEditingController bioController = TextEditingController(text: user.bio);
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Container(
            padding: const EdgeInsets.all(20),
            child: AnimatedPadding(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeOut,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n(context).lbl_userBio,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: TextField(
                          maxLength: 200,
                          maxLines: 4,
                          controller: bioController,
                          /*style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),*/
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: InputBorder.none,
                              hintText: l10n(context).lbl_describeYourself),
                        )),
                    const SizedBox(height: 5),
                    TextButton(
                        onPressed: () {
                          String value = bioController.text.trim();
                          userRepository.updateUser(user.id, bio: value);
                          Navigator.of(context).pop();
                        },
                        child: Text(l10n(context).lbl_save))
                  ],
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n(context).lbl_userBio,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 7),
        FirebaseAuthenticationCubitCubit.userBuilder(
          (user) => InkWell(
            onTap: () => _showEditDialog(context, user),
            child: (user.bio?.isNotEmpty ?? false)
                ? Text(user.bio!)
                : Text(
                    l10n(context).lbl_bioInfo,
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic),
                  ),
          ),
        ),
      ],
    );
  }
}
