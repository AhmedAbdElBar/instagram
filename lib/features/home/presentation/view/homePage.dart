import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/chat/presentation/view/caht_screen.dart';
import 'package:instagram/features/favoritespage/data/favorites_data.dart';
import 'package:instagram/features/favoritespage/presentation/view/favoritesPage.dart';
import 'package:instagram/features/home/data/postes_data.dart';
import 'package:instagram/features/home/data/storys_data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final story = StorysData();
  final post = PostesData();
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    story.storymaker();
    post.postMaker();
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
              icon: Icon(
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
              height: min(110, 200),
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: story.storys.length,
                itemBuilder: (context, index) {
                  return story.storys[index];
                },
              ),
            ),
            // Posts Section
            ListView.builder(
              shrinkWrap: true, // Ensures it takes only space that needed
              physics:
                  NeverScrollableScrollPhysics(), // Prevents nested scrolling
              itemCount: post.postes.length,
              itemBuilder: (context, index) {
                return post.postes[index];
              },
            ),
          ],
        ));
  }
}
