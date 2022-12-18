import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final bool selected;
  final double minWidth;
  final Function()? onPressed;

  const BottomNavItem(
      {super.key,
      required this.title,
      required this.icon,
      this.color,
      this.selected = false,
      this.minWidth = 80.0,
      this.onPressed});

  Widget _boldIcon(final IconData icon) {
    return Text(
      String.fromCharCode(icon.codePoint),
      style: TextStyle(
        inherit: false,
        color: color ?? Colors.black,
        fontSize: 24.0,
        fontWeight: FontWeight.w900,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
      ),
    );
  }

  /*Color _selectedColor(BuildContext context, Color color) {
    return Color.alphaBlend(
        Theme.of(context).colorScheme.primary.withOpacity(0.1),
        Theme.of(context).canvasColor);
  }*/

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(17),
      onTap: onPressed,
      child: Container(
          constraints: BoxConstraints(minWidth: minWidth),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color != null
                  ? Color.alphaBlend(
                      color!.withOpacity(0.1), Theme.of(context).canvasColor)
                  : null),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // Replace with a Row for horizontal icon + text
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  decoration: selected
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade100)
                      : null,
                  child: selected ? _boldIcon(icon) : Icon(icon, color: color)),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: selected ? FontWeight.w900 : null,
                      color: color),
                ),
              )
            ],
          )),
    );
  }
}
