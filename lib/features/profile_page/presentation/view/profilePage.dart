import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/home/data/storys_data.dart';
import 'package:instagram/features/home/presentation/widgets/post_widget.dart';
import 'package:instagram/features/profile_page/data/posts_data.dart';
import 'package:instagram/features/profile_page/presentation/widgets/Edite_and_other_buttons.dart';
import 'package:instagram/features/profile_page/presentation/widgets/Follow_and_other_buttons%20copy.dart';
import 'package:instagram/features/profile_page/presentation/widgets/customized_button_with_icon.dart';
import 'package:instagram/features/profile_page/presentation/widgets/profile_image_and_Followers.dart';

class Profilepage extends StatefulWidget {
  static const String routname = "ProfilePage";

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final story = StorysData();
  var postsData = PostsData();

  @override
  void initState() {
    super.initState();
    story.storymaker();
    postsData.postGeneration();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
      var arg = ModalRoute.of(context)?.settings.arguments as ProfileInfo;
      
    return Scaffold(
      backgroundColor: ThemingColor.maincolor,
      appBar: AppBar(
        backgroundColor: ThemingColor.maincolor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'username',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.verified,
              color: Colors.blue,
              size: 18,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage("assets/icons/notifications.png"))),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage("assets/icons/menu_dots.png"),
              size: 30,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ///profile image and followers
                ProfileImageAndFollowers(image: arg.profileImage,username: "",),

                ///discription.
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${arg.email}"),
                      Text(
                        "Category/Genre text",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt #hashtag",
                      ),
                      Text(
                        "Link goes here",
                        style: TextStyle(
                            color: ThemingColor.blueFontColor,
                            fontWeight: FontWeight.bold),
                      ),

                      ///followers.
                      Row(
                        children: [
                          Image(image: AssetImage("assets/images/Avatars.png")),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text.rich(
                              TextSpan(text: "Followed by ", children: [
                                TextSpan(
                                  text: "username, username",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: " and "),
                                TextSpan(
                                  text: "100 others",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ]),
                            ),
                          )
                        ],
                      ),

                      ///Follow and other buttons.
                      FollowAndOtherButtons(),

                      Container(
                        height: min(110, 200),
                        alignment: Alignment.center,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: story.storys.length - 1,
                          itemBuilder: (context, index) {
                            return story.storys[index + 1];
                          },
                        ),
                      ),
                      Row(
                        children: [
                          CustomizedButtonWithIcon(icon:ImageIcon(AssetImage("assets/icons/post_section.png"))),
                          CustomizedButtonWithIcon(icon:ImageIcon(AssetImage("assets/icons/reels.png"))),
                          CustomizedButtonWithIcon(icon:ImageIcon(AssetImage("assets/icons/frindes.png"))),
                        ],
                      ),

                      ///postes.
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(4),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return postsData.posts[index];
                        },
                      )
                    ],
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
