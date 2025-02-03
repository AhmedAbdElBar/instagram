import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/features/home/data/storys_data.dart';
import 'package:instagram/features/home/data/userdata.dart';
import 'package:instagram/features/profile_page/data/posts_data.dart';
import 'package:instagram/features/profile_page/presentation/widgets/Edite_and_other_buttons.dart';
import 'package:instagram/features/profile_page/presentation/widgets/customized_button_with_icon.dart';
import 'package:instagram/features/profile_page/presentation/widgets/profile_image_and_Followers.dart';
import 'package:instagram/features/settings/presentation/view/setteng_screen.dart';

class Myprofilepage extends StatefulWidget {
  static const String routname = "MyprofilePage";

  @override
  State<Myprofilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Myprofilepage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final story = StorysData();
  final user = Userdata();
  var postsData = PostsData();

  @override
  void initState() {
    super.initState();
    user.fetchUser().then((_) {
      setState(() {});
    });
    fetchData();
    postsData.postGeneration();
  }

  void fetchData() async {
    await story.fetchStories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Text(
              user.username ?? "Loading...",
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
            onPressed: () {
              Navigator.pushNamed(context, SettingScreen.routname);
            },
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
                ProfileImageAndFollowers(
                  image: user.profileImage ?? 'assets/posts/post (16).png',
                  username: user.username ?? 'Loading...',
                ),

                ///discription.
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category/Genre text",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        user.bio ?? "No bio available",
                      ),
                      Text(
                        "Link goes here",
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                      EditeAndOtherButtons(),

                      Container(
                        height: min(110, 200),
                        alignment: Alignment.center,
                        child: story.storys.isEmpty
                            ? Center(
                                child: Text(
                                "No stories available",
                              ))
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: story.storys.length,
                                itemBuilder: (context, index) {
                                  return story.storys[index];
                                },
                              ),
                      ),

                      Row(
                        children: [
                          CustomizedButtonWithIcon(
                              icon: ImageIcon(
                                  AssetImage("assets/icons/post_section.png"))),
                          CustomizedButtonWithIcon(
                              icon: ImageIcon(
                                  AssetImage("assets/icons/reels.png"))),
                          CustomizedButtonWithIcon(
                              icon: ImageIcon(
                                  AssetImage("assets/icons/frindes.png"))),
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
                        itemCount: postsData.posts.length,
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
