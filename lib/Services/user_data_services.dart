import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

String _uid = "";
final CollectionReference _userData =
    FirebaseFirestore.instance.collection("users");
CollectionReference _skills = _userData.doc(_uid).collection("skills");
Stream<DocumentSnapshot>? _stream;
Map<String, dynamic>? _data;
Map<String, Map<String, dynamic>> _skillData = new Map();

StreamSubscription<DocumentSnapshot> setUserID(String uid) {
  _uid = uid;
  _skills = _userData.doc(_uid).collection("skills");
  _skills.snapshots().listen((event) {
    _skillData = new Map();
    List<QueryDocumentSnapshot> list = event.docs;
    list.forEach((element) {
      _skillData.putIfAbsent(element.id, () => element.data());
    });
    print(_skillData);
  });
  _stream = _userData.doc(_uid).snapshots().asBroadcastStream();
  return _stream!.listen((event) {
    _data = event.data();
  }, onError: (e) => print('could not load data'));
}

String getUserID() {
  return _uid;
}

DocumentReference getUserReference() {
  return _userData.doc(_uid);
}

void createProfile(String firstName, String lastName, String bio) async {
  Map<String, dynamic> stats = {
    'used': 0,
    'didntUse': 0,
    'dontHave': 0,
    'history': [],
    'badges': 0,
    'achievementValue': 0,
    'skillcoins': 0
  };
  _skills.doc("awareness").set(stats);
  _skills.doc("skill").set(stats);
  _skills.doc("innovation").set(stats);
  _skills.doc("workforce").set(stats);
  _skills.doc("lead").set(stats);
  return await _userData.doc(_uid).set({
    'firstName': firstName,
    'lastName': lastName,
    'bio': bio,
    'accountType': "User"
  });
}

void createAdminProfile(String firstName, String lastName, String bio) async {
  return await _userData.doc(_uid).set({
    'firstName': firstName,
    'lastName': lastName,
    'bio': bio,
    'accountType': "Administrator",
    'currentClass': ""
  });
}

void updateProfile(String firstName, String lastName, String bio) {
  _userData
      .doc(_uid)
      .update({'firstName': firstName, 'lastName': lastName, 'bio': bio});
}

Map<String, dynamic> getUserData() {
  return _data!;
}

Map<String, Map<String, dynamic>> getUserSkillData() {
  return _skillData;
}

Stream<DocumentSnapshot> getUserStream() {
  return _stream!;
}

void updateSkillCount(String type, int used, int didntUse, int dontHave) {
  DocumentReference skill = _skills.doc(type);
  Map<String, dynamic> stats = {
    'used': used,
    'didntUse': didntUse,
    'dontHave': dontHave,
    'time': Timestamp.fromDate(DateTime.now())
  };
  skill.update(stats);
  skill.update({
    'history': FieldValue.arrayUnion([stats])
  });
}

void updateSteamSkills(String type, [int badges = 0, int skillCoins = 0]) {
  DocumentReference skill = _skills.doc(type);
  int mult;
  switch (type) {
    case "awareness":
      mult = 10;
      break;
    case "innovation":
      mult = 20;
      break;
    case "workforce":
      mult = 30;
      break;
    case "skill":
      mult = 40;
      break;
    case "lead":
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
