import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../repositories/storage_repository/storage_repository.dart';
import '../../../../utils/type_aliases.dart';

class _StorageBox {
  final String name;
  final Map<String, dynamic> content;
  _StorageBox(this.name, this.content);
}

class DevToolsStoragePage extends StatefulWidget {
  const DevToolsStoragePage({super.key});

  @override
  State<DevToolsStoragePage> createState() => _DevToolsStoragePageState();
}

class _DevToolsStoragePageState extends State<DevToolsStoragePage> {
  final StorageRepository _storage = StorageRepositoryImpl();
  List<_StorageBox> boxes = [];

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    List<String> names = _storage.getBoxNames();
    List<_StorageBox> boxes =
        names.map((n) => _StorageBox(n, _storage.getBoxContent(n))).toList();
    setState(() => this.boxes = boxes);
  }

  void _deleteBox(String name) async {
    await _storage.deleteBoxContent(name);
    update();
  }

  Widget _emptyView() {
    return Scaffold(
      appBar: AppBar(title: const Text("lokaler Speicher")),
      body: const Center(child: Text("Speicher ist leer")),
    );
  }

  String _prettyPrint(JsonMap content) =>
      const JsonEncoder.withIndent('  ').convert(content);

  @override
  Widget build(BuildContext context) {
    return boxes.isEmpty
        ? _emptyView()
        : DefaultTabController(
            length: boxes.length,
            child: Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                title: const Text("lokaler Speicher"),
                actions: [
                  IconButton(onPressed: update, icon: const Icon(Icons.refresh))
                ],
                bottom: TabBar(
                  indicatorColor: Colors.black,
                  tabs: [
                    for (_StorageBox b in boxes) Tab(text: b.name),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  for (_StorageBox b in boxes)
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(_prettyPrint(b.content)),
                            const SizedBox(height: 20),
                            TextButton.icon(
                                onPressed: () => _deleteBox(b.name),
                                icon: const Icon(FeatherIcons.trash),
                                label: const Text("Inhalt löschen")),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ));
  }
}
