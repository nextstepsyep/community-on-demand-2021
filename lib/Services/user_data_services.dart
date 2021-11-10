import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

String _uid = "";
final CollectionReference _userData =
    FirebaseFirestore.instance.collection("users");
CollectionReference _skills = _userData.doc(_uid).collection("skills");
Stream<DocumentSnapshot>? _stream;
Map<String, dynamic>? _data;

StreamSubscription<DocumentSnapshot> setUserID(String uid) {
  _uid = uid;
  _skills = _userData.doc(_uid).collection("skills");
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

void createProfile(String firstName, String lastName, String bio) {
  _userData
      .doc(_uid)
      .set({'firstName': firstName, 'lastName': lastName, 'bio': bio});
  // _skills.doc()
  _skills.doc("green").set({'badges': 0});
  _skills.doc("blue").set({'badges': 0});
  _skills.doc("red").set({'badges': 0});
  _skills.doc("purple").set({'badges': 0});
  _skills.doc("gold").set({'badges': 0}); //creating skill documents
  updateSteamSkills("green", 6, 12);
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

Future<void> updateSkillCount(
    String type, int used, int didntUse, int dontHave) async {
  DocumentReference skill = _skills.doc(type);
  Map<String, dynamic> stats = {
    'used': used,
    'didntUse': didntUse,
    'dontHave': dontHave,
    'time': Timestamp.fromDate(DateTime.now())
  };
  try {
    await skill.update(stats);
  } catch (e) {
    skill.set(stats);
  }
  skill.update({
    'history': FieldValue.arrayUnion([stats])
  });
}

void updateSteamSkills(String type, [int badges = 0, int skillCoins = 0]) {
  DocumentReference skill = _skills.doc(type);
  int mult;
  switch (type) {
    case "green":
      mult = 10;
      break;
    case "blue":
      mult = 20;
      break;
    case "red":
      mult = 30;
      break;
    case "purple":
      mult = 40;
      break;
    case "gold":
      mult = 50;
      break;
    default:
      throw Exception("$type is not a card type");
  }
  skill.update({
    'badges': FieldValue.increment(badges),
    'achievementValue': FieldValue.increment(badges * mult),
    'skillcoins': FieldValue.increment(skillCoins)
  });
}
