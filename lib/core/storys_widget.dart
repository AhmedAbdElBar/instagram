import 'package:flutter/material.dart';
import 'package:instagram/core/circleAvatar_with_border.dart';
import 'package:instagram/core/colors_thems.dart';

class StorysWidget extends StatelessWidget {
  late String image;
  late String email;
  late int index;
  StorysWidget({required this.image, required this.email, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleavatarWithBorder( chick: index, image: image,size: 35,),
                Container(
                  child: index == 1
                      ? Icon(
                          Icons.add_circle,
                          color: Color.fromRGBO(31, 161, 255, 1),
                        )
                      : SizedBox(),
                )
              ],
            ),
            Text(email)
          ],
        ),
      ),
    );
  }
}
