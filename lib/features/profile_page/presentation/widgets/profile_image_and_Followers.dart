import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/circleAvatar_with_border.dart';
import 'package:instagram/core/storys_widget.dart';

class ProfileImageAndFollowers extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  late String username ;
  late String image;

  ProfileImageAndFollowers({required this.image,required this.username});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Container(
            padding: EdgeInsets.only(left:10, right: 5),
            child: CircleavatarWithBorder(5,image: image, size: 40,)),
          //Followers & Following & Posts
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "1,234",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Posts',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "5,678",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "9000",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
