import 'package:flutter/material.dart';
import 'package:instagram/features/profile_page/presentation/widgets/full_screen_image_viewer.dart';

class PostsData {
  late List<Widget> posts = [];
  postGeneration() {
    for (int i = 1; i <= 15; i++) {
      posts.add(PostsInProfile(
        image: "assets/posts/post ($i).png",
      ));
    }
  }
}

class PostsInProfile extends StatelessWidget {
  late String image;
  PostsInProfile({required this.image});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenImageViewer(image: image,description: "",),
          ),
        );
      },
      child: Container(
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
