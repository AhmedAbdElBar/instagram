import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:instagram/features/home/presentation/widgets/post_widget.dart';

class FavoritesPage extends StatelessWidget {
  static const String routname = "facoritespage";
  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.favorites),
      ),
      body: StreamBuilder(
        stream: firestore.collection('Favorites').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.noLovedPostsYet,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          var favoritePosts = snapshot.data!.docs;

          return ListView(
            children: favoritePosts.map((post) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Post(
                      username: post["username"],
                      profileImage: post["profileImage"],
                      postImage: post["postImage"],
                      postCaption: post["caption"]));
            }).toList(),
          );
        },
      ),
    );
  }
}
