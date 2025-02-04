import 'package:flutter/material.dart';
import 'package:instagram/core/theme/colors_thems.dart';
import 'package:instagram/features/Explore_screen/presentation/view/exploreScreen.dart';
import 'package:instagram/features/home/data/userdata.dart';
import 'package:instagram/features/home/presentation/view/home_page.dart';
import 'package:instagram/features/profile_page/presentation/view/myProfilePage.dart';
import 'package:instagram/features/reels_screen/presentation/view/reelsScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final user = Userdata();

  @override
  void initState() {
    super.initState();
    user.fetchUser().then((_) {
      setState(() {});
    });
  }

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
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/icons/home.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/icons/search.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/icons/reels.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/icons/shopping.png"),
            ),
            label: '',
          ),
          // Profile Avatar Item
          BottomNavigationBarItem(
            icon: FutureBuilder(
              future: user.fetchUser(),
              builder: (context, snapshot) {
                // If data is still loading, show a default avatar
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircleAvatar(
                    radius: 15,
                    child: CircularProgressIndicator(),
                  );
                }
                // Once data is fetched, display the user's profile image
                return CircleAvatar(
                  radius: 15,
                  backgroundImage: user.profileImage != null
                      ? AssetImage("${user.profileImage}")
                      : AssetImage("assets/posts/post (10).png"),
                );
              },
            ),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Function to return the respective screen based on index
  Widget onClick() {
    if (currentIndex == 0) {
      return Homepage();
    } else if (currentIndex == 1) {
      return ExploreScreen();
    } else if (currentIndex == 2) {
      return Reelsscreen();
    } else if (currentIndex == 4) {
      return Myprofilepage();
    } else {
      return Container();
    }
  }
}
