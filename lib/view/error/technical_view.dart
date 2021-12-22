import 'package:flutter/material.dart';

class TechnicalExceptionView extends StatefulWidget {
  final Exception exception;
  const TechnicalExceptionView({Key? key, required this.exception})
      : super(key: key);

  @override
  State<TechnicalExceptionView> createState() => _TechnicalExceptionViewState();
}

class _TechnicalExceptionViewState extends State<TechnicalExceptionView> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
        dividerColor: Colors.transparent,
        elevation: expanded ? 3 : 0,
        expansionCallback: (_, value) => setState(() => expanded = !value),
        children: [
          ExpansionPanel(
              isExpanded: expanded,
              canTapOnHeader: true,
              headerBuilder: (context, open) => Container(
                  /*decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.grey.shade200, width: 1)),*/
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "technische Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:
                            Colors.grey.shade600), // Todo integrate with theme
                  )),
              body: Padding(
                padding: EdgeInsets.all(10),
                child: Text(widget.exception.toString()),
              ))
        ]);
  }
}
