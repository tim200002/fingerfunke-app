import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/cubits/live_config_cubit/live_config_cubit.dart';
import 'package:fingerfunke_app/models/asset/asset.dart';
import 'package:fingerfunke_app/models/post/post.dart';
import 'package:fingerfunke_app/models/user/user.dart';
import 'package:fingerfunke_app/repositories/post_repository/post_repository.impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevFunctionsPage extends StatelessWidget {
  const DevFunctionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DevTools | Funktionen")),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LiveConfig.builder(
            (config) => ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final User? currentUser =
                            BlocProvider.of<AuthenticationCubit>(context)
                                .state
                                .whenOrNull(signedIn: (user) => user);
                        PostRepositoryImpl().createPost(Event.createWithId(
                            author: currentUser!,
                            title: "Test post ${DateTime.now().second}",
                            visibility: post_visibility.visible,
                            description:
                                "Dieser post ist ein post der nur zu testzwecken um ${DateTime.now().toString()} erstellt wurde",
                            location: "ToDO Location",
                            media: [
                              VideoAsset(
                                  id: "test",
                                  assetId:
                                      "9h00XEtc4P3TbTXvChyimCMkPAfbVbkEGNEkNh7jBCsc",
                                  creationTime: DateTime.now(),
                                  state: asset_state.ready)
                            ],
                            startTime: DateTime.now()));
                      },
                      child: const Text("CreateRandomPost"),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
