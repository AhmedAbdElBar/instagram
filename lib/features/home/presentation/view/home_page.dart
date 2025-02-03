import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/circle_avatar_with_border.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/chat/presentation/view/caht_screen.dart';
import 'package:instagram/features/favorites_page/data/favorites_data.dart';
import 'package:instagram/features/favorites_page/presentation/view/favoritesPage.dart';
import 'package:instagram/features/home/data/storys_data.dart';
import 'package:instagram/features/home/data/userdata.dart';
import 'package:instagram/features/home/presentation/widgets/create_story.dart';
import 'package:instagram/features/home/presentation/widgets/post_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final story = StorysData();
  final user = Userdata();
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    user.fetchUser().then((_) {
      setState(() {});
    });
    story.fetchStories().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemingColor.maincolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/images/image.png',
          scale: 4,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(
                    lovedPosts: FavoritesDataManager().lovedPosts,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ChatScreen.routname);
            },
            icon: ImageIcon(
              AssetImage("assets/icons/messenger_icon.png"),
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage("assets/icons/add.png"),
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          // Stories Section
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: min(110, 200),
              alignment: Alignment.center,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CreateStory.routname);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleavatarWithBorder(
                              2,
                              image: "${user.profileImage}",
                              size: 35,
                            ),
                            Icon(
                              Icons.add_circle,
                              color: Color.fromRGBO(31, 161, 255, 1),
                            )
                          ],
                        ),
                        Text(
                          user.username ?? "User",
                          style: TextStyle(color: ThemingColor.blackFont),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
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
                              "no stories available !",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ),
                ],
              )),
          // Posts Section
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                      child: Text("No posts available!",
                          style: TextStyle(color: Colors.white)));
                }

                List<Post> posts = snapshot.data!.docs.map((doc) {
                  var data = doc.data() as Map<String, dynamic>;
                  return Post(
                    username: data['username'] ?? 'Unknown',
                    profileImage:
                        data['profileImage'] ?? 'assets/posts/post (16).png',
                    postImage: data['postImage'] ?? 'assets/posts/post (16).png',
                  );
                }).toList();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return posts[index];
                  },
                );
              })
        ],
      ),
    );
  }
}
