import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/circleAvatar_with_border.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/home/presentation/widgets/actions_for_posts.dart';
import 'package:instagram/features/profile_page/presentation/view/profilePage.dart';

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
    FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                      onTap: () {
                        Navigator.pushNamed(context, Profilepage.routname,
                            arguments: ProfileInfo(
                                email: email, profileImage: profileImage));
                      },
                      child: CircleavatarWithBorder(
                        5,
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

          //post image & Actions (Like - Comment - Bookmark)
          ActionsForPosts(
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
                        text: email,
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

class ProfileInfo {
  late String email;
  late String profileImage;
  ProfileInfo({required this.email, required this.profileImage});
}
