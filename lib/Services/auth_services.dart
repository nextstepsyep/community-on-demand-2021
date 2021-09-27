import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'user_data_services.dart';

StreamSubscription<DocumentSnapshot>? _userStream;
Future<void> checkAuth() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("Signed out");
    } else {
      print("Signed in");
    }
  } catch (e) {
    print(e);
  }
}

Future<UserCredential> signUp(email, password) async {
  try {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    _userStream = setUID(user.user!.uid);
    updateProfile('firstName', 'lastName', 'bio');
    return user;
  } catch (e) {
    print(e);
    throw new Exception("Exception with signUp method");
  }
}

Future<UserCredential> signIn(email, password) async {
  try {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    _userStream = setUID(user.user!.uid);
    return user;
  } catch (e) {
    print(e);
    throw new Exception("Exception with signIn method");
  }
}

Future<void> signOut() async {
  try {
    FirebaseAuth.instance.signOut();
    _userStream!.cancel();
  } catch (e) {
    print(e);
  }
}
