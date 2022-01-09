import 'package:flutter/material.dart';

class TextInputDialog extends StatefulWidget {
  final String title;
  final String? description;
  final String? hint;
  final String value;
  final Function(String) onSubmitted;
  const TextInputDialog(
      {Key? key,
      required this.title,
      this.description,
      this.hint,
      this.value = "",
      required this.onSubmitted})
      : super(key: key);

  static void show(
      {required BuildContext context,
      required String title,
      String? description,
      String? hint,
      String value = "",
      bool barrierDismissible = false,
      required Function(String) onSubmitted}) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) => TextInputDialog(
            title: title,
            description: description,
            hint: hint,
            value: value,
            onSubmitted: onSubmitted));
  }

  @override
  State<TextInputDialog> createState() => _TextInputDialogState();
}

class _TextInputDialogState extends State<TextInputDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _textField(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration.collapsed(
          hintText: widget.hint,
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      contentPadding: EdgeInsets.only(top: 20, left: 20, right: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.description != null)
            Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(widget.description!)),
          _textField(context)
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              widget.onSubmitted.call(_controller.text);
              Navigator.of(context).pop();
            },
            child: const Text('Ok')),
      ],
    );
  }
}
