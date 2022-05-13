import 'package:flutter/material.dart';

class IconTextItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subLabel;
  const IconTextItem(
      {required this.icon, required this.label, this.subLabel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(20)),
              child: Icon(
                icon,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (subLabel != null)
                Text(
                  subLabel!,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5)),
                )
            ],
          )
        ],
      ),
    );
  }
}
