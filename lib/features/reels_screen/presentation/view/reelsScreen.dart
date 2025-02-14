import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:instagram/features/reels_screen/presentation/view/video_player_item.dart';

class Reelsscreen extends StatefulWidget {
  const Reelsscreen({super.key});

  @override
  State<Reelsscreen> createState() => _ReelsscreenState();
}

class _ReelsscreenState extends State<Reelsscreen> {
  final List<String> videos = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(AppLocalizations.of(context)!.reels),
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
