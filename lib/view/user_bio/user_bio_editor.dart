import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/app_cubit/app_cubit.dart';
import '../../models/user/user.dart';
import '../../repositories/user_repository/user_repository.dart';

class UserBioEditor extends StatelessWidget {
  const UserBioEditor({super.key});

  void _showEditDialog(BuildContext context, User user) {
    UserRepository userRepository = UserRepositoryImpl();
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
                    const Text(
                      "bio",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: TextField(
                          maxLines: 4,
                          controller: bioController,
                          /*style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),*/
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: InputBorder.none,
                              hintText: "describe yourself"),
                        )),
                    const SizedBox(height: 5),
                    TextButton(
                        onPressed: () {
                          String value = bioController.text.trim();
                          userRepository.updateUser(user.id, bio: value);
                          Navigator.of(context).pop();
                        },
                        child: const Text("save"))
                  ],
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "bio",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 7),
          BlocBuilder<AppCubit, AppState>(
              builder: (context, state) => InkWell(
                    onTap: () => _showEditDialog(context, state.user),
                    child: (state.user.bio?.isNotEmpty ?? false)
                        ? Text(state.user.bio!)
                        : Text(
                            "add a short text about yourself",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontStyle: FontStyle.italic),
                          ),
                  )),
        ],
      ),
    );
  }
}
