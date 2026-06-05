import 'package:flutter/material.dart';
import '../widget/OmniPlayer.dart';

class VideoPlayer extends StatefulWidget {
  final String currentVideoUrl;

  const VideoPlayer({super.key, required this.currentVideoUrl});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: .start,
        children: [
          OmniPlayer(
            currentVideoUrl: widget.currentVideoUrl,
          ),
        ],
      ),
    );
  }
}
