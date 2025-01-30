import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

class FullScreenImageViewer extends StatefulWidget {
  final String image;
  FullScreenImageViewer({Key? key, required this.image}) : super(key: key);

  @override
  State<FullScreenImageViewer> createState() => _FullScreenImageViewerState();
}

class _FullScreenImageViewerState extends State<FullScreenImageViewer> {
  bool isLoved = false;
  bool isBookmarked = false;

  void toggleLove() {
    setState(() {
      isLoved = !isLoved;
    });
  }

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void shareImage() {
    Share.share('Check out this amazing photo: ${widget.image}');
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
                  // Add comment logic here
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Center(
            child: PhotoView(
              imageProvider: AssetImage(widget.image),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered,
            ),
          ),

          //  Action Buttons Positioned at the Bottom
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Like Button
                GestureDetector(
                  onTap: toggleLove,
                  child: Icon(
                    isLoved ? Icons.favorite : Icons.favorite_border,
                    size: 32,
                    color: isLoved ? Colors.red : Colors.white,
                  ),
                ),

                // Comment Button
                GestureDetector(
                  onTap: openCommentSection,
                  child: const Icon(
                    Icons.comment_outlined,
                    size: 32,
                    color: Colors.white,
                  ),
                ),

                // Share Button
                GestureDetector(
                  onTap: shareImage,
                  child: const Icon(
                    Icons.send,
                    size: 32,
                    color: Colors.white,
                  ),
                ),

                // Bookmark Button
                GestureDetector(
                  onTap: toggleBookmark,
                  child: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    size: 32,
                    color: isBookmarked ? Colors.yellow : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
