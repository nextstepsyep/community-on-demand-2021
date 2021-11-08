import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

String _uid = "";
final CollectionReference _userData =
    FirebaseFirestore.instance.collection("users");
Stream<DocumentSnapshot>? _stream;
Map<String, dynamic>? _data;

StreamSubscription<DocumentSnapshot> setUserID(String uid) {
  _uid = uid;
  _stream = _userData.doc(_uid).snapshots().asBroadcastStream();
  return _stream!.listen((event) => _data = event.data(),
      onError: (e) => print('could not load data'));
}

String getUserID() {
  return _uid;
}

DocumentReference getUserReference() {
  return _userData.doc(_uid);
}

void createProfile(String firstName, String lastName, String bio) async {
  return await _userData
      .doc(_uid)
      .set({'firstName': firstName, 'lastName': lastName, 'bio': bio, 'accountType' : "User"});
}

void createAdminProfile(String firstName, String lastName, String bio) async {
  return await _userData
      .doc(_uid)
      .set({'firstName': firstName, 'lastName': lastName, 'bio': bio, 'accountType' : "Administrator", 'currentClass' : ""});
}

void updateProfile(String firstName, String lastName, String bio) {
  _userData
      .doc(_uid)
      .update({'firstName': firstName, 'lastName': lastName, 'bio': bio});
}

Map<String, dynamic> getUserData() {
  return _data!;
}

Stream<DocumentSnapshot> getUserStream() {
  return _stream!;
}
