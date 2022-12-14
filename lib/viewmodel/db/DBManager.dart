import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sutoli/viewmodel/auth/authservice.dart';

class DataBaseManager {
  static const _userProfileCollection = 'userProfile';
  static const _allProductCollection = 'allProducts';

  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static final _userID = AuthService.currentUser?.uid;

  // Create user Database
  static Future<void> createUser(
      String name, String email, String address, String phone) async {
    return await db.collection(_userProfileCollection).doc(_userID).set({
      "uid": _userID,
      "name": name,
      "email": email,
      "address": address,
      "phone": phone,
      "status": "Offline"
    });
  }

  // User login method
  static Future<bool> isUser(String email) async {
    final snapshot = await db
        .collection(_userProfileCollection)
        .where('email', isEqualTo: email)
        .get();
    return snapshot.docs.isNotEmpty;
  }

  // Get all Product
  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllProduct() =>
      db.collection(_allProductCollection).snapshots();
}
