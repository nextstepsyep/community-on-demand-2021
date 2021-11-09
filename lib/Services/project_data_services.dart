import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Services/user_data_services.dart';


final CollectionReference _userData =
FirebaseFirestore.instance.collection("users");

final CollectionReference _projectsData =
FirebaseFirestore.instance.collection("projects");

Map<String, dynamic> _data = Map();
Map<String, Map<String, dynamic>>? _projects; //key: id, value: projectDocument
Stream<QuerySnapshot>? _stream;
Stream<DocumentSnapshot>? _docStream;

// A collection of projects is in the context of one teacher.
// Furthermore, one teacher's collection of projects will differ from another teacher's.
StreamSubscription<QuerySnapshot> initProjectStream() {
  //already called on main.dart
  _stream = _projectsData.snapshots().asBroadcastStream();
  return _stream!.listen((event) {
    _projects = new Map();
    List<QueryDocumentSnapshot> list = event.docs;
    list.forEach((element) {
      _projects!.putIfAbsent(element.id, () => element.data());
    });
    print(_projects);
  });
}

Future addProject(String projectName) async {
  return await _projectsData
      .doc()
      .set({'name': projectName, 'students' : Map()});
}

Map<String, dynamic> getData() {
  return _data;
}

void deleteProject(String id) {
  // Deletes class document w/ specified id. Since students are contained in a map
  // and not a sub-collection, nested deletion is not necessary.
  _projectsData.doc(id).get().then((snapshot) {
    snapshot.reference.delete();
  });
}

Map<String, Map<String, dynamic>>? getProjectsData() {
  return _projects;
}

Stream<QuerySnapshot>? getProjectStream() {
  return _stream;
}

Stream<DocumentSnapshot>? getDocStream() {
  return _docStream;
}

Future getProjects() async {
  List projects = [];

  try {
    await _projectsData.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        projects.add(element);
      });
    });
    return projects;
  } catch (e) {
    print(e.toString());
    return projects;
  }
}

bool studentInProject(String id) {
  String uid = getUserID();
  print(getProjectsData()![id]!['students']);
  return getProjectsData()![id]!['students'].containsKey(uid);
}
