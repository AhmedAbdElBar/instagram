import 'package:flutter/material.dart';
import 'package:instagram/core/colors_thems.dart';

class FavoritesPage extends StatefulWidget {
  final List<Widget> lovedPosts; // Receive list of favorite posts

  const FavoritesPage({Key? key, required this.lovedPosts}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemingColor.maincolor,
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: ThemingColor.maincolor,
      ),
      body: widget.lovedPosts.isNotEmpty
          ? ListView.builder(
              itemCount: widget.lovedPosts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.lovedPosts[index], // Display the post widget
                );
              },
            )
          : Center(
              child: Text(
                "No loved posts yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
