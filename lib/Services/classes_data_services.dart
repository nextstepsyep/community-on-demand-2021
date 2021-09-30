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

// Keep a separate doc for each array of classes to quickly find out size of array.
Future addClass(String className) async {
  QuerySnapshot querySnapshot = await _classesData.get();
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  String classCode = hash(allData.length);

  return await _classesData
      .doc()
      .set({'name': className, 'code': classCode});
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

Future getClasses() async {
  List classes = [];

  try {
    await _classesData.get().then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        classes.add(element.data());
      });
    });
    return classes;
  } catch (e) {
    print(e.toString());
    return classes;
  }
}
