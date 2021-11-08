import 'package:fingerfunke_app/cubits/cubit/authentication_cubit.dart';
import 'package:fingerfunke_app/view/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const App());
  }

  @override
  Widget build(BuildContext context) => const HomeView();

  /*@override
  Widget build(BuildContext context) {
    final AuthenticationState state =
        BlocProvider.of<AuthenticationCubit>(context).state;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("App in state $state"),
      ),
    );
  }*/
}
