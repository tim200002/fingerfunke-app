import 'package:flutter/material.dart';

class NewRecordButton extends StatefulWidget {
  final Function() onStartPressed;
  final Function() onStopPressed;
  final int maxRecodingLength;
  final bool isRecording;

  final double _size = 80;
  final double _margin = 10;
  const NewRecordButton(
      {required this.onStartPressed,
      required this.onStopPressed,
      required this.maxRecodingLength,
      required this.isRecording,
      Key? key})
      : super(key: key);

  @override
  _NewRecordButtonState createState() => _NewRecordButtonState();
}

class _NewRecordButtonState extends State<NewRecordButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(seconds: widget.maxRecodingLength), vsync: this);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onStopPressed.call();
      }
    });
    if (widget.isRecording) _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    const Color recordingColor = Colors.red;
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 300),
      child: !widget.isRecording
          ? InkWell(
              enableFeedback: false,
              onTap: widget.onStartPressed,
              child: Container(
                margin: EdgeInsets.all(widget._margin),
                width: widget._size - widget._margin * 2,
                height: widget._size - widget._margin * 2,
                //padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(widget._size)),
                child: const Icon(Icons.camera_rounded, color: Colors.white),
              ),
            )
          : InkWell(
              enableFeedback: false,
              onTap: widget.onStopPressed,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget? child) => SizedBox(
                      width: widget._size,
                      height: widget._size,
                      child: CircularProgressIndicator(
                        strokeWidth: 8,
                        color: Colors.white,
                        value: _animationController.value,
                      ),
                    ),
                  ),
                  Container(
                    width: widget._size - widget._margin * 2,
                    height: widget._size - widget._margin * 2,
                    //padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: recordingColor,
                        borderRadius: BorderRadius.circular(widget._size)),
                    child: const Icon(Icons.stop_rounded, color: Colors.white),
                  )
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
