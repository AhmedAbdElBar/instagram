import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/circle_avatar_with_border.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/core/provider/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:instagram/features/chat/presentation/view/caht_screen.dart';
import 'package:instagram/features/favorites_page/data/favorites_data.dart';
import 'package:instagram/features/favorites_page/presentation/view/favoritesPage.dart';
import 'package:instagram/features/home/data/storys_data.dart';
import 'package:instagram/features/home/data/userdata.dart';
import 'package:instagram/features/home/presentation/widgets/create_post.dart';
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

  Future<void> refreshData() async {
    await user.fetchUser(); 
    await story.fetchStories(); 
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          themeProvider.themeMode == ThemeMode.dark
              ? 'assets/images/image2.png'
              : 'assets/images/image1.png',
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
            onPressed: () {
              Navigator.pushNamed(context, CreatePost.routname);
            },
            icon: ImageIcon(
              AssetImage("assets/icons/add.png"),
              size: 30,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: Colors.blue,
        onRefresh: refreshData,
        child: ListView(
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
                                color: themeProvider.themeMode == ThemeMode.dark
                                    ? Colors.white
                                    : Color.fromRGBO(31, 161, 255, 1),
                              )
                            ],
                          ),
                          Text(
                            AppLocalizations.of(context)!.yourStory,
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
                                AppLocalizations.of(context)!.noStories,
                                style: TextStyle(color: ThemingColor.blackFont),
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
                        child: Text(AppLocalizations.of(context)!.noPosts,
                            style: TextStyle(color: Colors.white)));
                  }

                  List<Post> posts = snapshot.data!.docs.map((doc) {
                    var data = doc.data() as Map<String, dynamic>;
                    return Post(
                      username: data['username'] ?? 'Unknown',
                      profileImage:
                          data['profileImage'] ?? 'assets/posts/post (16).png',
                      postImage:
                          data['postImage'] ?? 'assets/posts/post (16).png',
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
      ),
    );
  }
}
