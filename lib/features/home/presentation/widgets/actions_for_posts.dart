import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/core/theme/colors_thems.dart';

import 'package:instagram/features/favorites_page/data/favorites_data.dart';
import 'package:instagram/features/home/presentation/widgets/post_widget.dart';
import 'package:instagram/features/profile_page/presentation/widgets/full_screen_image_viewer.dart';
import 'package:share_plus/share_plus.dart';

class ActionsForPosts extends StatefulWidget {
  final String postImage;
  final String username;
  ActionsForPosts({required this.postImage, required this.username});

  @override
  State<ActionsForPosts> createState() => _ActionsForPostsState();
}

class _ActionsForPostsState extends State<ActionsForPosts> {
  bool isLoved = false;
  bool isBookmarked = false;
  final auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void toggleLove() {
    setState(() {
      isLoved = !isLoved;
      if (isLoved) {
        FavoritesDataManager().addPost(
          Post(
            username: widget.username,
            profileImage: widget.postImage,
            postImage: widget.postImage,
          ),
        );
      } else {
        FavoritesDataManager().removePost(
          Post(
            username: widget.username,
            profileImage: widget.postImage,
            postImage: widget.postImage,
          ),
        );
      }
    });
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void shareImage() {
    Share.share('Check out this amazing photo: ${widget.postImage}');
  }

  void openCommentSection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Add a comment...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Post Comment'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Post Image
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImageViewer(
                  image: widget.postImage,
                  description: "",
                ),

              ),
            );
          },
          onDoubleTap: toggleLove, // Double-tap to like
          child: Container(
            width: double.infinity,
            child: Image(
              image: AssetImage(widget.postImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Like button
                  GestureDetector(
                    onTap: toggleLove,
                    child: Icon(
                      isLoved ? Icons.favorite : Icons.favorite_border_outlined,
                      size: 30,
                      color: isLoved ? Colors.red : null,
                    ),
                  ),

                  // Comment Button
                  GestureDetector(
                      onTap: openCommentSection,
                      child: ImageIcon(AssetImage("assets/icons/comment.png"))),

                  // Share Button
                  GestureDetector(
                      onTap: shareImage,
                      child: ImageIcon(AssetImage("assets/icons/send.png"))),
                ],
              ),
            ),
            //Book mark Button
            GestureDetector(
              onTap: toggleBookmark,
              child: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                size: 30,
                color: isBookmarked ? Colors.orange : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
