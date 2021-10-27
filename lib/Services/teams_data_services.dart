import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Services/user_data_services.dart';

final CollectionReference _teamsData =
    FirebaseFirestore.instance.collection("teams");
Map<String, Map<String, dynamic>>?
    _teams; //key: classCode, value: classDocument
//Map<int, String> _teamIDs = new Map(); //key: classCode, value: documentID
Stream<QuerySnapshot>? _stream;

StreamSubscription<QuerySnapshot> initTeamsStream() {
  //already called on main.dart
  _stream = _teamsData.snapshots().asBroadcastStream();
  return _stream!.listen((event) {
    _teams = new Map();
    List<QueryDocumentSnapshot> list = event.docs;
    list.forEach((element) {
      _teams!.putIfAbsent(element.id, () => element.data());
    });
    print(_teams);
  });
}

Map<String, Map<String, dynamic>>? getTeamsData() {
  return _teams;
}

Stream<QuerySnapshot>? getClassesStream() {
  return _stream;
}

void createTeam(String name) {
  String uid = getUserID();
  _teamsData.add({'name': name, 'students.$uid': getUserReference()});
}

void setTeamName(String id, String name) {
  _teamsData.doc(id).update({'name': name});
}

void joinTeam(String id) {
  String uid = getUserID();
  _teamsData.doc(id).update({'students.$uid': getUserReference()});
}

void leaveTeam(String id) {
  String uid = getUserID();
  _teamsData.doc(id).update({'students.$uid': FieldValue.delete()});
  // _classes![classCode]!['students'].removeWhere((key, value) => key == uid);
}
