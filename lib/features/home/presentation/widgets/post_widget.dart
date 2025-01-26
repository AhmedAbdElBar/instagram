import 'package:flutter/material.dart';
import 'package:instagram/core/circleAvatar_with_border.dart';
import 'package:instagram/core/colors_thems.dart';
<<<<<<< HEAD
import 'package:instagram/features/home/presentation/widgets/actions_for_posts.dart';

class Post extends StatefulWidget {
  final String email;
  final String profileImage;
  final String postImage;

  Post({
    required this.email,
    required this.profileImage,
    required this.postImage,
  });

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> with SingleTickerProviderStateMixin {
  bool isLoved = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleLove() {
    setState(() {
      isLoved = !isLoved;
      if (isLoved) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

=======

class Post extends StatelessWidget {
  late String email;
  late String profileImage;
  late String postImage;
  Post(
      {required this.email,
      required this.profileImage,
      required this.postImage});
>>>>>>> fc7b9a2048f45adce46d48df3bb4210310619cf7
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
<<<<<<< HEAD
        border: Border.all(color: ThemingColor.lightGrayColor, width: 1),
      ),
=======
          border: Border.all(color: ThemingColor.lightGrayColor, width: 1)),
>>>>>>> fc7b9a2048f45adce46d48df3bb4210310619cf7
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    InkWell(
<<<<<<< HEAD
                      child: CircleavatarWithBorder(
                          chick: 10, size: 20, image: widget.profileImage),
                    ),
                    SizedBox(width: 10),
=======
                        child: CircleavatarWithBorder(
                            chick: 10, size: 20, image: profileImage)),
                    SizedBox(
                      width: 10,
                    ),
>>>>>>> fc7b9a2048f45adce46d48df3bb4210310619cf7
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
<<<<<<< HEAD
                          widget.email,
=======
                          email,
>>>>>>> fc7b9a2048f45adce46d48df3bb4210310619cf7
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(
                          "Sponsored",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
<<<<<<< HEAD
                    ),
=======
                    )
>>>>>>> fc7b9a2048f45adce46d48df3bb4210310619cf7
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage("assets/icons/menu_dots.png"),
                  size: 40,
                ),
              )
            ],
          ),
          Container(
<<<<<<< HEAD
            width: double.infinity,
            child: Image(
              image: AssetImage(widget.postImage),
              fit: BoxFit.cover,
            ),
          ),
          ActionsForPosts(),
=======
              width: double.infinity,
              child: Image(
                image: AssetImage(postImage),
                fit: BoxFit.cover,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                      ),
                    ),
                    InkWell(
                      child: ImageIcon(
                        AssetImage("assets/icons/comment.png"),
                        size: 30,
                      ),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.send_outlined,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_outline,
                  size: 30,
                ),
              )
            ],
          ),
>>>>>>> fc7b9a2048f45adce46d48df3bb4210310619cf7
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
<<<<<<< HEAD
                  "100 likes",
=======
                  "100 like",
>>>>>>> fc7b9a2048f45adce46d48df3bb4210310619cf7
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
<<<<<<< HEAD
                        text: "${widget.email} ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'Lorem ipsum dolor sit amet, consectetur...',
                      ),
=======
                          text: "$email",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'Lorem ipsum dolor sit amet, consectetur...'),
>>>>>>> fc7b9a2048f45adce46d48df3bb4210310619cf7
                    ],
                  ),
                ),
                Text(
                  "View all 16 comments",
                  style: TextStyle(
                    color: ThemingColor.darkGrayColor,
                  ),
<<<<<<< HEAD
                ),
=======
                )
>>>>>>> fc7b9a2048f45adce46d48df3bb4210310619cf7
              ],
            ),
          )
        ],
      ),
    );
  }
}
