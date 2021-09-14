import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {
  String _uid = "";
  final CollectionReference _userData =
      FirebaseFirestore.instance.collection("users");

  DataBase._internal(); //private constructor
  static final DataBase database =
      DataBase._internal(); //singleton design pattern
  void setUID(String uid) {
    this._uid = uid;
  }

  Future updateProfile(String firstName, String lastName, String bio) async {
    return await _userData
        .doc(_uid)
        .set({'firstName': firstName, 'lastName': lastName, 'bio': bio});
  }

  Stream<DocumentSnapshot> getData() {
    return _userData.doc(_uid).snapshots();
  }
}
