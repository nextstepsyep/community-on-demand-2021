import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

String _uid = "";
final CollectionReference _userData =
    FirebaseFirestore.instance.collection("users");
CollectionReference _skills = _userData.doc(_uid).collection("skills");
Stream<DocumentSnapshot>? _stream;
Map<String, dynamic>? _data;
Map<String, Map<String, dynamic>> _skillData = new Map();
/**
 * sets the User ID of the user and initializes the user data stream and
 * user skill data stream as well as attach listeners to the stream to gather
 * data from the database and any changes within the database which are stored
 * in the _data data structure
 * @param uid the User ID of the logged in account
 * @return the stream of data from the database
 */
StreamSubscription<DocumentSnapshot> setUserID(String uid) {
  _uid = uid;
  _skills = _userData.doc(_uid).collection("skills");
  _skills.snapshots().listen((event) {
    _skillData = new Map();
    List<QueryDocumentSnapshot> list = event.docs;
    list.forEach((element) {
      _skillData.putIfAbsent(element.id, () => element.data());
    });
  }, onError: (e) => print('could not load user skill data'));
  _stream = _userData.doc(_uid).snapshots().asBroadcastStream();
  return _stream!.listen((event) {
    _data = event.data();
  }, onError: (e) => print('could not load user profile data'));
}

/**
 * gets the user ID
 * @return the user ID
 */
String getUserID() {
  return _uid;
}

/**
 * gets the user reference
 * @return the user reference
 */
DocumentReference getUserReference() {
  return _userData.doc(_uid);
}

/**
 * creates a new profile of a user by taking in their first name, last name,
 * and bio as information and initializing thier stat values to zero which will
 * all be sent to the database
 * @param firstName the first name of the user
 * @param lastName the last name of the user
 * @param bio the bios of the user
 */
void createProfile(String firstName, String lastName, String bio) async {
  Map<String, dynamic> stats = {
    'used': 0,
    'didntUse': 0,
    'dontHave': 0,
    'history': [],
    'badges': 0,
    'achievementValue': 0,
    'skillcoins': 0,
    'totalValue': 0
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

/**
 * creates an admin profile with the given first name, last name,
 * and bios as information that will be sent to the database.
 * @param firstName the first name of the admin
 * @param lastName the last name of the admin
 * @param bio the bios of the admin
 */
void createAdminProfile(String firstName, String lastName, String bio) async {
  return await _userData.doc(_uid).set({
    'firstName': firstName,
    'lastName': lastName,
    'bio': bio,
    'accountType': "Administrator",
    'currentClass': ""
  });
}

/**
 * updates the firstname, lastName, and bio of the user profile
 * @param firstName the first name of the user
 * @param lastName the last name of the user
 * @param bio the bios of the user
 */
void updateProfile(String firstName, String lastName, String bio) {
  _userData
      .doc(_uid)
      .update({'firstName': firstName, 'lastName': lastName, 'bio': bio});
}

/**
 * gets the user data in the form of a map data structure
 * @return the data of the user
 */
Map<String, dynamic> getUserData() {
  return _data!;
}

/**
 * gets the user skill data in the form of a map data structure
 * @return the data of the user
 */
Map<String, Map<String, dynamic>> getUserSkillData() {
  return _skillData;
}

/**
 * gets the stream of the user data which can be used in streambuilder widgets
 * @return the stream of the user data
 */
Stream<DocumentSnapshot> getUserStream() {
  return _stream!;
}

/**
 * updates the skill stats of the user after taking the card game
 * and sends it to the database
 * @param type the type of skill to be updated
 * @param used number of times this type of skill was used
 * @didnt didntUse number of time this type of skill wasn't used
 * @param dontHave number of times this type of skill the user did not have
 * @param totalValue the total value of the skill
 */
void updateSkillCount(
    String type, int used, int didntUse, int dontHave, int totalValue) {
  DocumentReference skill = _skills.doc(type);
  Map<String, dynamic> stats = {
    'used': used,
    'didntUse': didntUse,
    'dontHave': dontHave,
    'totalValue': totalValue,
    'time': Timestamp.fromDate(DateTime.now())
  };
  skill.update(stats);
  skill.update({
    'history': FieldValue.arrayUnion([stats])
  });
}

/**
 * gets the total skill value of the particular type of skill
 * @param category the type of skill
 * @return the total skill value
 */
String getCardTotal(String category) {
  return "${getUserSkillData()[category]!['totalValue']}";
}

/**
 * updates the steam skills stats of the user
 * @param type the type of steam skill to be updated
 * @param badges the number of badges to be incremented toward the total number of badges
 * @param skillCoins the number of skills coins to be incremented toward the total number of skillcoins
 */
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
