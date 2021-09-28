import 'package:community_on_demand_code_demo/Services/classes_data_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Keeps a list of Class objects that can be displayed to the front-end.
class ClassesController {
  final CollectionReference classesData = FirebaseFirestore.instance.collection("classes");
  List<String> classesList = <String>[];
}