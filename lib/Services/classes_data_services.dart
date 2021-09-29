import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Services/user_data_services.dart';
import 'package:flutter/material.dart';

final CollectionReference _classData =
    FirebaseFirestore.instance.collection("classes");
Map<int, Map<String, dynamic>>? _classes; //key: classCode, value: classDocument
Map<int, String> _classIDs = new Map(); //key: classCode, value: documentID
Stream<QuerySnapshot>? _stream;

StreamSubscription<QuerySnapshot> initClassesStream() {
  //already called on main.dart
  _stream = _classData.snapshots().asBroadcastStream();
  return _stream!.listen((event) {
    _classes = new Map();
    List<QueryDocumentSnapshot> list = event.docs;
    list.forEach((element) {
      _classes!.putIfAbsent(element.data()['code'], () => element.data());
      _classIDs.putIfAbsent(element.data()['code'], () => element.id);
    });
    print(_classes);
  });
}

Map<int, Map<String, dynamic>>? getClassesData() {
  return _classes;
}

Stream<QuerySnapshot>? getClassesStream() {
  return _stream;
}

void createClass(String name, int code, String teacher) {
  if (_classes!.containsKey(code)) {
    throw new Exception("Class with code $code already exists");
  }
  _classData
      .add({'name': name, 'code': code, 'teacher': teacher, 'students': {}});
}

void joinClass(int classCode) {
  String uid = getUserID();
  _classData
      .doc(_classIDs[classCode])
      .update({'students.$uid': getUserReference()});
}
