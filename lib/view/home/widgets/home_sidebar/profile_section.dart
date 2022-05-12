part of "./home_sidebar_view.dart";

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({Key? key}) : super(key: key);

  Widget _profile(BuildContext context, {User? user}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        UserImage(
          user?.picture?.downloadUrl,
          diameter: 70,
        ),
        const SizedBox(height: 18),
        Text(
          user?.name ?? "anmelden",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        if (user != null)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              "Telefonnummer",
              style: TextStyle(),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius:
            const BorderRadius.only(topRight: HomeSidebar._borderRadius),
        onTap: () => Navigator.popAndPushNamed(context, accountRoute),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.1)))),
          child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) => state.maybeWhen(
                signedIn: (user) => _profile(context, user: user),
                signedInAnonymously: () => _profile(context),
                orElse: () => ErrorWidget(InvalidStateException())),
          ),
        ));
  }
}
