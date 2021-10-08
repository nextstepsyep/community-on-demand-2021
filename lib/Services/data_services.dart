import 'package:cloud_firestore/cloud_firestore.dart';

String _uid = "";
final CollectionReference _userData =
    FirebaseFirestore.instance.collection("users");
Stream<DocumentSnapshot> _stream = _userData.doc(_uid).snapshots();
Map<String, dynamic> _data = Map();
void setUID(String uid) {
  _uid = uid;
  _stream = _userData.doc(_uid).snapshots();
  _stream.listen((event) => _data = event.data() as Map<String, dynamic>,
      onError: (e) => print('could not load data'));
}

Future updateProfile(String firstName, String lastName, String bio, String accountType) async {
  return await _userData
      .doc(_uid)
      .set({'firstName': firstName, 'lastName': lastName, 'bio': bio, 'accountType' : accountType});
}

Map<String, dynamic> getData() {
  return _data;
}
