import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? get currentUser => auth.currentUser;

  Stream<QuerySnapshot> getMessages() {
    return firestore.collection("messages").orderBy("timestamp").snapshots();
  }

  Future<void> sendMessage(String message) async {
    if (message.isNotEmpty && currentUser != null) {
      await firestore.collection("messages").add({
        "content": message,
        "sender": currentUser!.email,
        "timestamp": FieldValue.serverTimestamp(),
      });
    }
  }
}
