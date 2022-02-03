part of '../exception_view.dart';

/// Widget for displaying technical information about an exception. This is
/// a widget for use with the [ExceptionView]
class _TechnicalExceptionView extends StatelessWidget {
  final Object exception;
  final StackTrace? trace;

  /// Display an expandable Widget that shows technical information about the
  /// recorded Exception. Takes an [exception] and an optional [trace]
  const _TechnicalExceptionView({Key? key, required this.exception, this.trace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: const Text("technische Details"), children: [
      ListTile(
        title: Text(
          exception.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        subtitle: trace == null ? null : Text(trace.toString()),
      ),
    ]);
  }
}
