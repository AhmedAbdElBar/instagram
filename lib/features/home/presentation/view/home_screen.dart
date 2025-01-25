import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/home/data/postes_data.dart';
import 'package:instagram/features/home/data/storys_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
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
            shrinkWrap: true, // Ensures it takes only as much space as needed
            physics:
                NeverScrollableScrollPhysics(), // Prevents nested scrolling
            itemCount: post.postes.length,
            itemBuilder: (context, index) {
              return post.postes[index];
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ThemingColor.maincolor,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/home.png"),
                color: ThemingColor.iconsColors),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/search.png"),
                color: ThemingColor.iconsColors),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/reels.png"),
                color: ThemingColor.iconsColors),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/shopping.png"),
                color: ThemingColor.iconsColors),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/posts/post (12).png"),
            ),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
