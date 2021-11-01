import 'package:community_on_demand_code_demo/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'Services/classes_data_services.dart';
import 'Services/teacher_data_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initClassesStream();
  initTeacherStream();
  initCurrentClassStream();
  return runApp(
    MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    ),
  );
}