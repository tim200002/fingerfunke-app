import 'package:get_it/get_it.dart';

import '../../../../models/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../models/user/user.dart';
import '../../../../repositories/user_repository/user_repository.dart';
import '../../../../routes.dart';
import '../../../../utils/tools.dart';
import '../../../../utils/util_widgets/future_text.dart';
import '../../../report_send/widgets/chip_chooser.dart';

class ModReportView extends StatelessWidget {
  final Report report;
  final UserRepository _userRepository = GetIt.instance<UserRepository>();
  ModReportView({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<User> authorFuture = _userRepository.getUser(report.authorId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(report.type.name, style: Theme.of(context).textTheme.labelLarge),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton.icon(
                icon: const Icon(FeatherIcons.externalLink),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade500)),
                onPressed: () => Navigator.pushNamed(context, Routes.post,
                    arguments: report.objectReference),
                label: Text(l10n(context).lbl_modOpenPost))),
        FutureText(authorFuture
            .then((value) => l10n(context).lbl_modReportedBy + value.name)),
        const SizedBox(
          height: 10,
        ),
        Text(l10n(context).lbl_modReportedBecause),
        const SizedBox(
          height: 5,
        ),
        ChipChooser<ReportReason>(
            selected: report.reasons,
            chips: ReportReason.values
                .map((e) => ChipData(e.name.toString(), e))
                .toList())
      ],
    );
  }
}
