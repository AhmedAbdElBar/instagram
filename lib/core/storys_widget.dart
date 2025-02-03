import 'package:flutter/material.dart';
import 'package:instagram/core/circle_avatar_with_border.dart';
import 'package:instagram/features/profile_page/presentation/widgets/full_screen_image_viewer.dart';


class StorysWidget extends StatelessWidget {
  late String image;
  late String description;
  late String username;
  late int index;
  StorysWidget({super.key, required this.image, required this.username, required this.index,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullScreenImageViewer(image: image, description: description,),
            ),
          );
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleavatarWithBorder(
                1,
                image: image,
                size: 35,
              ),
              Text(username)
            ],
          ),
        ),
      ),
    );
  }
}
