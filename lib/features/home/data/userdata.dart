import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Userdata {
  String? username;
  String? profileImage;
  String? bio; 
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> fetchUser() async {
    User? currentUser = auth.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(currentUser.uid).get();

      if (userDoc.exists) {
        username = userDoc['username'];
        profileImage = userDoc['profileImage']; 
        bio = userDoc['bio']; 
      }
    }
  }
}
