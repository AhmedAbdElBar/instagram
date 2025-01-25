import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/features/home/presentation/widgets/post_widget.dart';

class PostesData {
  List<Widget> postes = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  postMaker() {
    for (int i = 1; i < 15; i++) {
      postes.add(Post(
        email: "${auth.currentUser!.email}",
        postImage: "assets/posts/post (${i + 1}).png",
        profileImage: "assets/posts/post ($i).png",
      ));
    }
  }
}
