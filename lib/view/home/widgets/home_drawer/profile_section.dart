part of 'home_drawer_view.dart';

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
        if (user?.hasClearance(User.clearanceAdmin))
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: Chip(
                visualDensity: VisualDensity.compact,
                label: Text("admin"),
                backgroundColor: Colors.orange.shade300,
              ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(topRight: HomeDrawer._borderRadius),
      onTap: () => Navigator.popAndPushNamed(context, Routes.account),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.1)))),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) => _profile(context, user: state.user),
        ),
      ),
    );
  }
}
