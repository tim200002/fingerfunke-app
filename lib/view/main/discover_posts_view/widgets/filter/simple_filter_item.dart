import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

/// simple visual toggle button that acts like a regular switch but is aligned
/// with the visual style of fingerfunke
class SimpleToggle extends StatelessWidget {
  final String label;
  final Function(bool v) onChanged;
  final bool enabled;
  final double borderwidth;
  const SimpleToggle(
      {super.key,
      required this.label,
      required this.onChanged,
      this.enabled = false,
      this.borderwidth = 1.5});

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).colorScheme.primary;
    final Color? textColor = enabled ? primary : null;
    return InkWell(
      onTap: () => onChanged(!enabled),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: enabled
                ? Color.alphaBlend(
                    primary.withOpacity(0.1), Theme.of(context).canvasColor)
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: borderwidth,
                color: enabled ? primary : Colors.grey.shade100)),
        child: Row(
          children: [
            Expanded(child: Text(label, style: TextStyle(color: textColor))),
            const SizedBox(width: 10),
            Icon(enabled ? FeatherIcons.check : null, color: textColor)
          ],
        ),
      ),
    );
  }
}

class SimpleMultiValueToggle extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final Function(int selectedIndex) onChanged;
  final bool enabled;
  final double borderwidth;

  const SimpleMultiValueToggle(
      {required this.labels,
      required this.selectedIndex,
      required this.onChanged,
      this.enabled = false,
      this.borderwidth = 1.5,
      super.key});

  @override
  Widget build(BuildContext context) {
    final Color primary = Theme.of(context).colorScheme.primary;
    final Color? textColor = enabled ? primary : null;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: enabled
              ? Color.alphaBlend(
                  primary.withOpacity(0.1), Theme.of(context).canvasColor)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: borderwidth,
              color: enabled ? primary : Colors.grey.shade100)),
      child: Row(
        children: [
          for (int i = 0; i < labels.length; i++)
            Expanded(
              child: InkWell(
                onTap: () => onChanged(i),
                child: Text(labels[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: i == selectedIndex ? textColor : null,
                        fontWeight: i == selectedIndex ? FontWeight.bold : null)),
              ),
            )
        ],
      ),
    );
  }
}
