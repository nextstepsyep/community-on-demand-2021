import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Screens/Home/navigationBodies/past_projects_screen.dart';

String _classId = "";
final CollectionReference _classesData =
FirebaseFirestore.instance.collection("classes");
Stream<DocumentSnapshot> _stream = _classesData.doc(_classId).snapshots();
Map<String, dynamic> _data = Map();

// A collection of classes is in the context of one teacher.
// Furthermore, one teacher's collection of classes will differ from another teacher's.

// Used for switching classes.
void switchClass(String id) {
  _classId = id;
  _stream = _classesData.doc(_classId).snapshots();
  _stream.listen((event) => _data = event.data() as Map<String, dynamic>,
      onError: (e) => print('could not load data'));
}

// TODO: How to ensure classCode is always unique?
Future addClass(String className, String classCode) async {
  return await _classesData
      .doc()
      .set({'className': className, 'classCode': classCode});
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
