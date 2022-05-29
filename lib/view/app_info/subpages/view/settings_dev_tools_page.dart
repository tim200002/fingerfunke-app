import 'package:fingerfunke_app/cubits/live_config_cubit/live_config_cubit.dart';
import 'package:fingerfunke_app/view/app_info/subpages/view/settings_dev_functions_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '../../../../utils/util_widgets/admin_appbar.dart';

class DevToolsPage extends StatelessWidget {
  const DevToolsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar.widget(AdminFunction.development, title: "DevTools"),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LiveConfig.builder(
            (config) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton.icon(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const DevFunctionsPage())),
                      icon: const Icon(FeatherIcons.play),
                      label: const Text("Entwicklungs-Funktionen")),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: LiveConfig.configs.length,
                      itemBuilder: ((context, index) {
                        LiveConfig config = LiveConfig.configs[index];
                        return SettingsTile.switchTile(
                            title:
                                (config.unused ? "[OLD] " : "") + config.name,
                            enabled: !config.unused,
                            subtitle: config.description,
                            subtitleMaxLines: 5,
                            onToggle: (s) => config.onToggle(context, s),
                            switchValue: config.isSelected(context));
                      })),
                ),
              ],
            ),
          )),
    );
  }
}
