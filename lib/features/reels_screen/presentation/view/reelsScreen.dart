import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/features/reels_screen/presentation/view/video_player_item.dart';
import 'package:video_player/video_player.dart';

class Reelsscreen extends StatefulWidget {
  const Reelsscreen({super.key});

  @override
  State<Reelsscreen> createState() => _ReelsscreenState();
}

class _ReelsscreenState extends State<Reelsscreen> {
  final List<String> videos = [
    'assets/videos/(1).MP4',
    'assets/videos/(2).MP4',
    'assets/videos/(3).MP4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reels"),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Center(child: VideoPlayerItem(videoPath: videos[index]));
        },
      ),
    );
  }
}
