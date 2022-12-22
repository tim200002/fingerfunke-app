part of "location_filter_view.dart";

class _FilterItem extends StatefulWidget {
  final String _off;
  final String _on;
  final Function(bool) _onChanged;
  final bool _initialState;
  final double _borderwidth = 1.5;
  const _FilterItem(this._off, this._on, this._initialState, this._onChanged,
      {super.key});

  @override
  State<_FilterItem> createState() => __FilterItemState();
}

class __FilterItemState extends State<_FilterItem> {
  late bool state;
  @override
  void initState() {
    state = widget._initialState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        borderWidth: 1,
        borderColor: Colors.grey.shade100,
        selectedBorderColor: Colors.grey.shade100,
        constraints: BoxConstraints.expand(
            width: constraints.maxWidth / 2 - (widget._borderwidth * 3) / 2,
            height: 70),
        children: [
          Text(widget._off, textAlign: TextAlign.center),
          Text(widget._on, textAlign: TextAlign.center),
          //Icon(FeatherIcons.thumbsUp),
          //Icon(FeatherIcons.meh),
        ],
        onPressed: (int index) {
          setState(() {
            state = index == 1;
          });

          widget._onChanged(state);
        },
        isSelected: [!state, state],
      ),
    );
  }
}
