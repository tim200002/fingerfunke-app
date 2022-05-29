import 'package:fingerfunke_app/models/report.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';
import '../../../report/widgets/chip_chooser.dart';

class ModReportView extends StatelessWidget {
  final Report report;
  const ModReportView({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            report.type.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey.shade500)),
                  onPressed: () => Navigator.pushNamed(context, Routes.post,
                      arguments: report.objectReference),
                  child: Text("Beitrag öffnen"))),
          Text("gemeldet von: ${report.author.name}"),
          const SizedBox(
            height: 10,
          ),
          Text("gemeldet wegen:"),
          const SizedBox(
            height: 5,
          ),
          ChipChooser<ReportReason>(
              selected: report.reasons,
              chips: ReportReason.values
                  .map((e) => ChipData(e.name.toString(), e))
                  .toList())
        ],
      ),
    );
  }
}
