import 'package:flutter/material.dart';
import 'package:instagram/core/circleAvatar_with_border.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/home/presentation/widgets/actions_for_posts.dart';

class Post extends StatefulWidget {
  final String email;
  final String profileImage;
  final String postImage;

  Post({
    required this.email,
    required this.profileImage,
    required this.postImage,
  });

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> with SingleTickerProviderStateMixin {
  bool isLoved = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleLove() {
    setState(() {
      isLoved = !isLoved;
      if (isLoved) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ThemingColor.lightGrayColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    InkWell(
                      child: CircleavatarWithBorder(
                          chick: 10, size: 20, image: widget.profileImage),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.email,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(
                          "Sponsored",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage("assets/icons/menu_dots.png"),
                  size: 40,
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            child: Image(
              image: AssetImage(widget.postImage),
              fit: BoxFit.cover,
            ),
          ),
          ActionsForPosts(),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "100 likes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${widget.email} ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Lorem ipsum dolor sit amet, consectetur...',
                      ),
                    ],
                  ),
                ),
                Text(
                  "View all 16 comments",
                  style: TextStyle(
                    color: ThemingColor.darkGrayColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
