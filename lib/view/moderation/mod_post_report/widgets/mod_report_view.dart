import '../../../../models/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../routes.dart';
import '../../../report_send/widgets/chip_chooser.dart';

class ModReportView extends StatelessWidget {
  final Report report;
  const ModReportView({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                label: const Text("Beitrag öffnen"))),
        Text("gemeldet von: ${report.author.name}"),
        const SizedBox(
          height: 10,
        ),
        const Text("gemeldet wegen:"),
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
