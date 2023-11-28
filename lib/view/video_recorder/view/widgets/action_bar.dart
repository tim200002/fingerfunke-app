import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/video_recorder_cubit.dart';

class RecodingActionBar extends StatefulWidget {
  final Function() onStartPressed;
  final Function() onStopPressed;
  final int maxRecodingLength;
  final bool isRecording;

  final double _size = 80;
  final double _margin = 10;
  const RecodingActionBar(
      {required this.onStartPressed,
      required this.onStopPressed,
      required this.maxRecodingLength,
      required this.isRecording,
      Key? key})
      : super(key: key);

  @override
  _RecodingActionBarState createState() => _RecodingActionBarState();
}

class _RecodingActionBarState extends State<RecodingActionBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool isShowingGallery = false;
  bool isRecording = false;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(seconds: widget.maxRecodingLength), vsync: this);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onStopPressed.call();
      }
    });
    if (widget.isRecording) _animationController.forward();
    super.initState();
  }

  Widget _getGalleryButton(BuildContext context) {
    // Show no Camera Button when recording
    if (isRecording || widget.isRecording) {
      return const Spacer();
    }
    return Expanded(
      child: FloatingActionButton(
        onPressed: isShowingGallery
            ? null
            : () async {
                setState(() {
                  isShowingGallery = true;
                });
                await context.read<VideoRecorderCubit>().openGallery();
                setState(() {
                  isShowingGallery = false;
                });
              },
        child: const Icon(Icons.photo_library_rounded),
      ),
    );
  }

  Widget _getRecordButton(BuildContext context) {
    const Color recordingColor = Colors.red;

    if (isRecording) {
      return const Spacer();
    }
    if (!widget.isRecording) {
      return InkWell(
        enableFeedback: false,
        onTap: () {
          setState(() {
            isRecording = true;
          });

          widget.onStartPressed();
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
      );
    }
    return InkWell(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getGalleryButton(context),
          _getRecordButton(context),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
