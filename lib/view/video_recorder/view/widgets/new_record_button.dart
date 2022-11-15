import 'package:flutter/material.dart';

class NewRecordButton extends StatefulWidget {
  final Function() onRecordingStarted;
  final Function() onRecordingFinished;
  final Function(int ms) onCountdownStarted;
  final int maxRecodingLength;

  final double _size = 80;
  final double _margin = 10;
  const NewRecordButton(
      {required this.onRecordingStarted,
      required this.onRecordingFinished,
      required this.onCountdownStarted,
      required this.maxRecodingLength,
      Key? key})
      : super(key: key);

  @override
  _NewRecordButtonState createState() => _NewRecordButtonState();
}

class _NewRecordButtonState extends State<NewRecordButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(seconds: widget.maxRecodingLength), vsync: this);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onRecordingFinished.call();
      }
    });
  }

  void _startRecording() {
    _animationController.forward();
    setState(() {
      isRecording = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 300),
      child: isRecording == false
          ? InkWell(
              enableFeedback: false,
              onTap: () {
                widget.onRecordingStarted();
                _startRecording();
              },
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
              onTap: widget.onRecordingFinished,
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
                        color: Theme.of(context).colorScheme.primary,
                        value: _animationController.value,
                      ),
                    ),
                  ),
                  Container(
                    width: widget._size - widget._margin * 2,
                    height: widget._size - widget._margin * 2,
                    //padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
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
