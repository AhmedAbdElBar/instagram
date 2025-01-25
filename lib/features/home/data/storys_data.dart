import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/storys_widget.dart';

class StorysData {
  List<Widget> storys = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  storymaker() {
    for (int i = 1; i <= 15; i++) {
      storys.add(StorysWidget(
        image: "assets/posts/post ($i).png",
        email: "lable",
        index: i,
      )
      );
    }
  }
}
