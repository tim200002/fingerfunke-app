import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevelopementUtilFunctionsPage extends StatelessWidget {
  const DevelopementUtilFunctionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Developement helpers")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              final User? currentUser =
                  BlocProvider.of<AuthenticationCubit>(context)
                      .state
                      .whenOrNull(signedIn: (user) => user);
              PostRepositoryImpl().createPost(Post.createWithId(
                  type: post_type.event,
                  author: currentUser!,
                  title: "Test post",
                  visibility: post_visibility.visible,
                  description:
                      "Dieser post ist ein post der nur zu testzwecken um ${DateTime.now().toString()} erstellt wurde",
                  location: "ToDO Location",
                  media: const [],
                  creationTime: DateTime.now()));
            },
            child: const Text("CreateRandomPost"),
          )
        ],
      ),
    );
  }
}
