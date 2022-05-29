import 'package:flutter/material.dart';

class ChipData<T> {
  final String label;
  final T value;
  const ChipData(
    this.label,
    this.value,
  );
}

class ChipChooser<T> extends StatelessWidget {
  final List<ChipData<T>> chips;
  final List<T> selected;
  final Function(List<T> selected)? onChanged;
  const ChipChooser(
      {Key? key, required this.chips, this.onChanged, this.selected = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      children: [
        for (ChipData c in chips)
          ChoiceChip(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: selected.contains(c.value)
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: Colors.transparent,
            selectedColor: Theme.of(context).colorScheme.primary.withAlpha(150),
            label: Text(c.label),
            selected: selected.contains(c.value),
            onSelected: onChanged == null
                ? (_) {}
                : (b) {
                    List<T> list = List.from(selected);
                    b ? list.add(c.value) : list.remove(c.value);
                    onChanged!(list);
                  },
          )
      ],
    );
  }
}
