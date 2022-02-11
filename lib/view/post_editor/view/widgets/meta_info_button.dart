import 'package:flutter/material.dart';

/// Template for a field to show information which if pressed for example opens a dialog to enter the date
class MetaInfoButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final String text;
  const MetaInfoButton(
      {required this.onPressed,
      required this.icon,
      required this.text,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(icon),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade50),
                child: Text(text,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
