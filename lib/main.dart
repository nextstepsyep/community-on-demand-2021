import 'package:community_on_demand_code_demo/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    ),
  );
}