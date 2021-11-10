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

void addProject(String projectName) async {
  // map of <user id, reference path to user>
  // the path of the user is just "/users/<user id>"
  var students = [];
  if (getUserReference() != null) {
    students = [getUserReference()];
  }

  DocumentReference ref = _projectsData.doc();
  return await ref.set({'name': projectName, 'students' : students, 'description' : ""});
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

String getDescription(String id) {
  if (getProjectsData() == null || getProjectsData()![id] == null || getProjectsData()![id]!['description'] == null) {
    return "";
  } else {
    return getProjectsData()![id]!['description'].toString();
  }
}

void updateDescription(String str, String id) {
  _projectsData.doc(id).update({'description' : str});
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

List<String> getMembers(String id) {
  List<dynamic> list = getProjectsData()![id]!['students'];
  List<String> ret = [];
  for (DocumentReference v in list) {
    v.get().then((snapshot) {
      ret.add(snapshot.data()!['firstName'].toString() + " " + snapshot.data()!['lastName'].toString());
    });
  }
  return ret;
}

bool studentInProject(String id) {
  List<dynamic> list = getProjectsData()![id]!['students'];
  for (DocumentReference v in list) {
    print(v.id);
    print(getUserReference().id);
    if (v.id == getUserReference().id) {
      return true;
    }
  }
  return false;
}
