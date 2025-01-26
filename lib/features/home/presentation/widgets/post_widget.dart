import 'package:flutter/material.dart';
import 'package:instagram/core/circleAvatar_with_border.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/home/presentation/widgets/actions_for_posts.dart';

class Post extends StatelessWidget {
  final String email;
  final String profileImage;
  final String postImage;

  Post({
    required this.email,
    required this.profileImage,
    required this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ThemingColor.lightGrayColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    InkWell(
                      child: CircleavatarWithBorder(
                        chick: 10,
                        size: 20,
                        image: profileImage,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          email,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "Sponsored",
                          style: TextStyle(fontSize: 12),
                        ),
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
              ),
            ],
          ),
          // Post Image
          Container(
            width: double.infinity,
            child: Image(
              image: AssetImage(postImage),
              fit: BoxFit.cover,
            ),
          ),
          // Actions (Like, Comment, Bookmark)
          ActionsForPosts(),
          // Likes, Comments, and Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "100 likes",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "$email ",
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
          ),
        ],
      ),
    );
  }
}
