import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram/core/storys_widget.dart';

class StorysData extends ChangeNotifier {
  List<Widget> storys = [];

  Future<void> fetchStories() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('storys').get();
    storys = snapshot.docs.map((doc) {
      return StorysWidget(
        image: doc['storyImage'],
        username: doc['username'],
        index: storys.length + 1,
        description: doc['description'],
      );
    }).toList();

    notifyListeners(); 
  }
}
