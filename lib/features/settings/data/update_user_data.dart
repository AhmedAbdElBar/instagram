import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UpdateUserData {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String?> uploadImage(File imageFile) async {
    try {
      String uid = auth.currentUser!.uid;
      Reference ref = storage.ref().child("profileImages/$uid.jpg");
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  Future<void> updateUserProfile({
    required String username,
    required String bio,
    required String profileImage,
    required String email,
  }) async {
    String uid = auth.currentUser!.uid; // Get current user ID
    await firestore.collection("users").doc(uid).update({
      "username": username,
      "bio": bio,
      "profileImage": profileImage,
      "email": email
    });
  }
}
