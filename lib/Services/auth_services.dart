import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_on_demand_code_demo/Services/user_data_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

final CollectionReference _userData =
FirebaseFirestore.instance.collection("users");
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

// Adds created user to administrators or users array
Future<UserCredential> signUp(email, password, accountType) async {
  try {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    _userStream = setUserID(user.user!.uid);
    // After updateProfile, user is added to users collection
    if (accountType == "Administrator") {
      createAdminProfile('firstName', 'lastName', 'bio');
    } else {
      createProfile('firstName', 'lastName', 'bio');
    }

    // Update the list of teachers to add the new account
    if (accountType == "Administrator") {
      _userData.doc("teachers").update({'users': FieldValue.arrayUnion([_userData.doc(user.user!.uid)])});
    }
    return user;
  } catch (e) {
    print(e);
    throw new Exception("Exception with signUp method");
  }
}

// Gets the account type of the given uid (admin or user)
Future<String> getUserType(String uid) async {
  String ret = "";
  await _userData.doc(uid).get().then((snapshot) {
    if (snapshot.data() == null) {
      return "";
    } else {
      ret = snapshot.data()!['accountType'].toString();
    }
  });
  return ret;
}

Future<UserCredential> signIn(email, password) async {
  try {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    _userStream = setUserID(user.user!.uid);
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
