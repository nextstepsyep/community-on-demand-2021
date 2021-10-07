import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/past_projects_screen.dart';

String _classId = "";
final CollectionReference _classesData =
FirebaseFirestore.instance.collection("classes");

Map<String, dynamic> _data = Map();
Map<int, QueryDocumentSnapshot>? _classes; //key: classCode, value: classDocument
Map<int, String> _classIDs = new Map(); //key: classCode, value: documentID
Stream<QuerySnapshot>? _stream;

// A collection of classes is in the context of one teacher.
// Furthermore, one teacher's collection of classes will differ from another teacher's.
StreamSubscription<QuerySnapshot> initClassesStream() {
  //already called on main.dart
  _stream = _classesData.snapshots().asBroadcastStream();
  return _stream!.listen((event) {
    _classes = new Map();
    List<QueryDocumentSnapshot> list = event.docs;
    list.forEach((element) {
      _classes!.putIfAbsent(element.data()['code'], () => element);
      _classIDs.putIfAbsent(element.data()['code'], () => element.id);
    });
    print(_classes);
  });
}

// Used for switching classes.
void switchClass(String id) {
  _classId = id;
}

// Keep a separate doc for each array of classes to quickly find out size of array.
Future addClass(String className) async {
  QuerySnapshot querySnapshot = await _classesData.get();
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  return await _classesData
      .doc()
      .set({'name': className, 'code': allData.length});
}

// Creates a 4 digit class code based each digit having a value of [0-9]
// Any leftover digits is prepended with 0s -> ex: 9 -> 0009
String hash(int numClasses) {
  String classes = "$numClasses";
  int prepend = 4 - classes.length;
  String prefix = "";
  for (int i = 0; i < prepend; i++)
    prefix += "0";

  prefix += classes;
  return prefix;
}

Future addStudent(String classId, String studentId) async {
  return await _classesData
      .doc(classId)
      .collection('students')
      .add({'uid': studentId});
}

Map<String, dynamic> getData() {
  return _data;
}

void deleteClass(String id) {
  // Deletes class document w/ specified id. Since students are contained in a map
  // and not a sub-collection, nested deletion is not necessary.
  _classesData.doc(id).get().then((snapshot) {
    snapshot.reference.delete();
  });
}

void updateCurrentClass() {

}

Map<int, QueryDocumentSnapshot>? getClassesData() {
  return _classes;
}

Stream<QuerySnapshot>? getClassesStream() {
  return _stream;
}

Future getClasses() async {
  List classes = [];

  try {
    await _classesData.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        classes.add(element);
      });
    });
    return classes;
  } catch (e) {
    print(e.toString());
    return classes;
  }
}
