import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';
import 'package:instagram/features/Explore_screen/presentation/view/exploreScreen.dart';
import 'package:instagram/features/home/data/postes_data.dart';
import 'package:instagram/features/home/data/storys_data.dart';
import 'package:instagram/features/home/presentation/view/homePage.dart';
import 'package:instagram/features/profile_page/presentation/view/myProfilePage.dart';
import 'package:instagram/features/profile_page/presentation/view/profilePage.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemingColor.maincolor,
      body: onClick(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
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

  Widget onClick() {
    if (currentIndex == 0) {
      return Homepage();
    } else if (currentIndex == 1) {
      return ExploreScreen();
    } else if (currentIndex == 4) {
      return Myprofilepage();
    } else {
      return Container();
    }
  }
}
