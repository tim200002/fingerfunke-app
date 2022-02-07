import 'package:flutter/material.dart';

/// Button which can be either selected or not
///
/// For example used for switch between group and event
class SelectableButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final String text;
  final bool selected;
  const SelectableButton({
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = selected ? Colors.black : Colors.grey;
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(text,
                style: TextStyle(
                    color: color,
                    fontWeight:
                        selected ? FontWeight.bold : FontWeight.normal)),
          )
        ],
      ),
    );
  }
}
