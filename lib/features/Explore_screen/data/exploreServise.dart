import 'package:cloud_firestore/cloud_firestore.dart';

class ExploreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> searchUsers(String query) {
    return firestore
        .collection("users")
        .where("username", isGreaterThanOrEqualTo: query)
        .where("username", isLessThan: query + 'z') // Efficient search
        .snapshots();
  }
}
