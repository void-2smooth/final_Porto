import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoOnceThenImage extends StatefulWidget {
  final String videoAsset;
  final String imageAsset;
  final double width;
  final double height;

  const VideoOnceThenImage({
    super.key,
    required this.videoAsset,
    required this.imageAsset,
    required this.width,
    required this.height,
  });

  @override
  VideoOnceThenImageState createState() => VideoOnceThenImageState();
}

class VideoOnceThenImageState extends State<VideoOnceThenImage> {
  late VideoPlayerController _controller;
  bool _showImage = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        _controller.setVolume(0);
        _controller.play();
        setState(() {});
        _controller.addListener(() {
          if (_controller.value.position >= _controller.value.duration &&
              !_showImage) {
            setState(() {
              _showImage = true;
            });
          }
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: _showImage
          ? Image.asset(widget.imageAsset, fit: BoxFit.cover)
          : _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const CircularProgressIndicator(),
    );
  }
}
