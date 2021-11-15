import 'package:fingerfunke_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/utils/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mein Account"),
      ),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) => state.maybeWhen(
            signedIn: (_) => Column(
                  children: const [
                    TopBar(),
                    TopList(),
                    BottomList(),
                    DevelopementList()
                  ],
                ),
            signedInAnonymously: () => Column(
                  children: const [TopList()],
                ),
            orElse: () => ErrorWidget(InvalidStateException())),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return state.maybeWhen(
            signedIn: (user) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red),
                      ),
                      Container(
                        width: 10,
                      ),
                      Text(
                        user.name,
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ],
                  ),
                ),
            orElse: () => ErrorWidget(InvalidStateException()));
      },
    );
  }
}

class BottomList extends StatelessWidget {
  const BottomList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsButton(text: "Datenschutz", onPressed: () {}),
          SettingsButton(text: "Impressum", onPressed: () {}),
        ],
      ),
    );
  }
}

class TopList extends StatelessWidget {
  const TopList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsButton(text: "SocialMedia", onPressed: () {}),
          SettingsButton(
            text: "Account verwalten",
            onPressed: () {
              Navigator.of(context).pushNamed("/manageAccount");
            },
          ),
        ],
      ),
    );
  }
}

class DevelopementList extends StatelessWidget {
  const DevelopementList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsButton(
            text: "Developement utils",
            onPressed: () {
              Navigator.of(context).pushNamed("/developementUtils");
            },
          ),
        ],
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const Icon(Icons.arrow_right)
        ],
      ),
    );
  }
}
