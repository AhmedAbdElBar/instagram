import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoPath; 
  VideoPlayerItem({required this.videoPath});

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController controller;
  bool isPlaying = true;
  bool showPlayPause = false;
  bool isLoved = false;
  bool showLoved = false;
  bool isBookmarked = false;

  void toggleLove() {
    setState(() {
      isLoved = !isLoved;
      showLoved = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          showLoved = false;
        });
      }
    });
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void shareImage() {
    Share.share('Check out this amazing video!');
  }

  void openCommentSection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.postComment,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.postComment),
              ),
            ],
          ),
        );
      },
    );
  }

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

  void PlayAndPause() {
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
        isPlaying = false;
      } else {
        controller.play();
        isPlaying = true;
      }
      showPlayPause = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          showPlayPause = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GestureDetector(
          onTap: PlayAndPause,
          onDoubleTap: toggleLove,
          child: Container(
              child: Center(
            child: controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                : Center(child: CircularProgressIndicator()),
          )),
        ),
        if (showPlayPause)
          Center(
            child: Container(
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 80,
                color: const Color.fromARGB(189, 255, 255, 255),
              ),
            ),
          ),
        if (showLoved)
          Center(
            child: Container(
              child: isLoved
                  ? Icon(
                      Icons.favorite,
                      size: 80,
                      color: const Color.fromARGB(189, 255, 255, 255),
                    )
                  : null,
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Like button
                    GestureDetector(
                      onTap: toggleLove,
                      child: Icon(
                        isLoved
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 30,
                        color: isLoved ? Colors.red : null,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // Comment Button
                    GestureDetector(
                        onTap: openCommentSection,
                        child:
                            ImageIcon(AssetImage("assets/icons/comment.png"))),
                    SizedBox(
                      width: 10,
                    ),

                    // Share Button
                    GestureDetector(
                        onTap: shareImage,
                        child: ImageIcon(AssetImage("assets/icons/send.png"))),
                  ],
                ),
              ),
              //Book mark Button
              GestureDetector(
                onTap: toggleBookmark,
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                  size: 30,
                  color: isBookmarked ? Colors.orange : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
