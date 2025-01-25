import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class ActionsForPosts extends StatefulWidget {
  const ActionsForPosts({super.key});

  @override
  State<ActionsForPosts> createState() => _ActionsForPostsState();
}

class _ActionsForPostsState extends State<ActionsForPosts> {
  bool isLoved = false; 
  bool isBookmarked = false; 

  void toggleLove() {
    setState(() {
      isLoved = !isLoved; 
    });
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: toggleLove, 
                child: Icon(
                  isLoved
                      ? Icons.favorite 
                      : Icons.favorite_border_outlined, 
                  size: 30,
                  color: isLoved ? Colors.red : ThemingColor.iconsColors,
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle comment action
                },
                child: ImageIcon(
                  AssetImage("assets/icons/comment.png"),
                  size: 30,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.send_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: toggleBookmark, 
          child: Icon(
            isBookmarked
                ? Icons.bookmark 
                : Icons.bookmark_outline, 
            size: 30,
            color: isBookmarked ? Colors.orange : ThemingColor.iconsColors,
          ),
        ),
      ],
    );
  }
}
