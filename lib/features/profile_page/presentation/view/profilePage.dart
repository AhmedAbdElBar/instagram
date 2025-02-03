import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/home/data/storys_data.dart';
import 'package:instagram/features/home/data/userdata.dart';
import 'package:instagram/features/home/presentation/widgets/post_widget.dart';
import 'package:instagram/features/profile_page/data/posts_data.dart';
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
  final user = Userdata();

  @override
  void initState() {
    super.initState();
    story.fetchStories(); // Only fetch stories once
    user.fetchUser().then((_) {
      setState(() {}); // Refresh the UI once user data is fetched
    });
    postsData.postGeneration(); // Fetch posts data
  }

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as ProfileInfo?;

    return Scaffold(
      backgroundColor: ThemingColor.maincolor,
      appBar: AppBar(
        backgroundColor: ThemingColor.maincolor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              arg!.username,
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Image and Followers
              ProfileImageAndFollowers(
                image: arg.profileImage,
                username: arg.username,
              ),

              // Description Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${arg.username}"),
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

                    // Followers Section
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

                    // Follow and Other Buttons
                    FollowAndOtherButtons(),

                    // Stories Section
                    Container(
                      height: 110,
                      alignment: Alignment.center,
                      child: story.storys.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: story.storys.length,
                              itemBuilder: (context, index) {
                                return story.storys[index];
                              },
                            )
                          : Center(
                              child: Text(
                                "No stories found",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                    ),

                    // Action Buttons
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

                    // Posts Section
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
      ),
    );
  }
}
