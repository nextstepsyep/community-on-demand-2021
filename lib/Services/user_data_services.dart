import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

String _uid = "";
final CollectionReference _userData =
    FirebaseFirestore.instance.collection("users");
CollectionReference _skills = _userData.doc(_uid).collection("skills");
Stream<DocumentSnapshot>? _stream;
Map<String, dynamic>? _data;
Map<String, Map<String, dynamic>>? _skillData;

StreamSubscription<DocumentSnapshot> setUserID(String uid) {
  _uid = uid;
  _skills = _userData.doc(_uid).collection("skills");
  _skills.snapshots().listen((event) {
    List<QueryDocumentSnapshot> list = event.docs;
    list.forEach((element) {
      _skillData!.putIfAbsent(element.id, () => element.data());
    });
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

void createProfile(String firstName, String lastName, String bio) {
  _userData
      .doc(_uid)
      .set({'firstName': firstName, 'lastName': lastName, 'bio': bio});
  // _skills.doc()
  _skills.doc("awareness").set({'badges': 0});
  _skills.doc("innovation").set({'badges': 0});
  _skills.doc("workforce").set({'badges': 0});
  _skills.doc("skill").set({'badges': 0});
  _skills.doc("lead").set({'badges': 0}); //create skill documents
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
