import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoPath; // Renamed for clarity
  VideoPlayerItem({required this.videoPath});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        controller.play();
        controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Expanded(
            child: Container(
                child: Center(
          child: controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                )
              : Center(child: CircularProgressIndicator()),
        ))),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.favorite_border,
<<<<<<< HEAD
=======
                color: Colors.black,
>>>>>>> 1865bb0964837456e5808f3726541786ff46fd28
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.comment,
<<<<<<< HEAD
=======
                color: Colors.black,
>>>>>>> 1865bb0964837456e5808f3726541786ff46fd28
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.send,
<<<<<<< HEAD
=======
                color: Colors.black,
>>>>>>> 1865bb0964837456e5808f3726541786ff46fd28
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
