import 'package:flutter/material.dart';
import 'package:instagram/core/circle_avatar_with_border.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/features/home/presentation/widgets/actions_for_posts.dart';
import 'package:instagram/features/profile_page/presentation/view/profilePage.dart';

class Post extends StatelessWidget {
  final String username;
  final String profileImage;
  final String postImage;

  Post({
    required this.username,
    required this.profileImage,
    required this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
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
                      onTap: () {
                        Navigator.pushNamed(context, Profilepage.routname,
                            arguments: ProfileInfo(
                                username: username,
                                profileImage: profileImage));
                      },
                      child: CircleavatarWithBorder(
                        1,
                        size: 20,
                        image: profileImage,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
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

          //post image & Actions (Like - Comment - Bookmark)
          ActionsForPosts(
            username: username,
            postImage: postImage,
          ),
          // Description
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
                        text: username,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' Lorem ipsum dolor sit amet, consectetur...',
                      ),
                    ],
                  ),
                ),
                Text(
                  "View all 16 comments",
                  style: TextStyle(
                    color: ThemingColor.blueFontColor,
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

class ProfileInfo {
  late String username;
  late String profileImage;
  ProfileInfo({required this.username, required this.profileImage});
}
