import 'package:flutter/material.dart';

class RecordButton extends StatefulWidget {
  static const Color color = Colors.greenAccent;
  static const double size = 80;
  static const double _margin = 10;
  static const heroTag = "video_recorder_button";

  final int maxSeconds;
  final Function() onPressed;
  //final Function()? onFinished;
  const RecordButton(
      {Key? key, required this.maxSeconds, required this.onPressed})
      : super(key: key);

  @override
  _RecordButtonState createState() => _RecordButtonState();

  static Widget startButton({required Function() onPressed}) {
    return InkWell(
        enableFeedback: false,
        onTap: onPressed,
        child: Hero(
          tag: RecordButton.heroTag,
          child: Container(
            margin: const EdgeInsets.all(_margin),
            width: RecordButton.size - _margin * 2,
            height: RecordButton.size - _margin * 2,
            //padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: RecordButton.color,
                borderRadius: BorderRadius.circular(RecordButton.size)),
            child: const Icon(Icons.camera_rounded, color: Colors.white),
          ),
        ));
  }
}

class _RecordButtonState extends State<RecordButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: widget.maxSeconds),
    vsync: this,
  )..forward();

  @override
  void initState() {
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) widget.onPressed.call();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onTap: widget.onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) => SizedBox(
              width: RecordButton.size,
              height: RecordButton.size,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                color: RecordButton.color,
                value: _controller.value,
              ),
            ),
          ),
          Hero(
            tag: RecordButton.heroTag,
            child: Container(
              width: RecordButton.size - RecordButton._margin * 2,
              height: RecordButton.size - RecordButton._margin * 2,
              //padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: RecordButton.color,
                  borderRadius: BorderRadius.circular(RecordButton.size)),
              child: const Icon(Icons.stop_rounded, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
