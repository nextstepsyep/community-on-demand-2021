import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

String _uid = "";
final CollectionReference _userData =
    FirebaseFirestore.instance.collection("users");
Stream<DocumentSnapshot>? _stream;
Map<String, dynamic>? _data;

StreamSubscription<DocumentSnapshot> setUID(String uid) {
  _uid = uid;
  _stream = _userData.doc(_uid).snapshots().asBroadcastStream();
  return _stream!.listen((event) => _data = event.data(),
      onError: (e) => print('could not load data'));
}

Future updateProfile(String firstName, String lastName, String bio) async {
  return await _userData
      .doc(_uid)
      .set({'firstName': firstName, 'lastName': lastName, 'bio': bio, 'accountType' : "User"});
}

Future updateAdminProfile(String firstName, String lastName, String bio) async {
  return await _userData
      .doc(_uid)
      .set({'firstName': firstName, 'lastName': lastName, 'bio': bio, 'accountType' : "Administrator", 'currentClass' : ""});
}

Map<String, dynamic> getUserData() {
  return _data!;
}

Stream<DocumentSnapshot> getUserStream() {
  return _stream!;
}
