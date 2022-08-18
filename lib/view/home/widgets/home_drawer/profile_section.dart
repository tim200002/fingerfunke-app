part of 'home_drawer_view.dart';

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({Key? key}) : super(key: key);

  Widget _profile(BuildContext context, {final User? user}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        UserImage(
          user?.picture,
          diameter: 55,
        ),
        const SizedBox(height: 18),
        Text(user?.name ?? l10n(context).lbl_login,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        if ((user?.clearance?.level ?? 0) > 1)
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Chip(
                visualDensity: VisualDensity.compact,
                label: Text(
                  user!.clearance!.label,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                backgroundColor: user.clearance!.color.shade300,
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
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
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
