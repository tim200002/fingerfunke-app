import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/app_cubit/app_cubit.dart';
import '../../models/user/user.dart';
import '../../repositories/user_repository/user_repository.dart';
import '../../utils/json_tools.dart';
import '../../utils/tools.dart';
import '../../utils/type_aliases.dart';
import 'social_media_services.dart';

class UserSocialMediaPage extends StatelessWidget {
  const UserSocialMediaPage({super.key});

  void _openServiceDialog(BuildContext context, SocialMediaService service,
      FirestoreId userId, Map<String, String> accounts) {
    String? username = JsonTools.nullable<String>(accounts, service.host);
    UserRepository userRepository = UserRepositoryImpl();
    TextEditingController usernameController =
        TextEditingController(text: username);

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
                  children: [
                    Row(
                      children: [
                        Icon(service.icon),
                        const SizedBox(width: 15),
                        Text(
                          service.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: TextField(
                          controller: usernameController,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              border: InputBorder.none,
                              hintText: "username",
                              prefixText: "@"),
                        )),
                    const SizedBox(height: 5),
                    TextButton(
                        onPressed: () {
                          String value = usernameController.text.trim();
                          if (value == "") {
                            accounts.remove(service.host);
                          } else {
                            accounts[service.host] = value;
                          }
                          userRepository.updateUser(userId,
                              socialMedia: accounts);
                          Navigator.of(context).pop();
                        },
                        child: const Text("save"))
                  ],
                ))));
  }

  Widget _item(BuildContext context, SocialMediaService service, User user) {
    String? username =
        JsonTools.nullable<String>(user.socialMedia, service.host);
    return InkWell(
      onTap: () =>
          _openServiceDialog(context, service, user.id, user.socialMedia),
      child: Container(
        padding: const EdgeInsets.only(bottom: 27),
        child: Row(
          children: [
            Icon(service.icon),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(service.name),
                  Text(
                    username != null ? "@$username" : "not linked",
                    style: username != null
                        ? const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            fontSize: 18,
                            //fontStyle: FontStyle.italic,
                            color: Colors.grey.shade600,
                          ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text(l10n(context).lbl_linkSocialMedia)),
        body: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) => ListView.builder(
                  key: Key("${state.user.socialMedia}"),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  itemCount: SocialMediaService.services.length,
                  itemBuilder: (context, i) => _item(
                      context, SocialMediaService.services[i], state.user),
                )));
  }
}
