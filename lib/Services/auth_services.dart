import 'package:firebase_auth/firebase_auth.dart';

Future<void> checkAuth() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("Signed out");
    } else {
      print("Signed in");
    }
  } catch(e) {
    print(e);
  }
}

Future<UserCredential> signUp(email, password) async {
  try {
    UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return user;
  } catch(e) {
    print(e);
    throw new Exception("Sign Up Error");
  }
}

Future<UserCredential> signIn(email, password) async {
  try {
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return user;
  } catch(e) {
    print(e);
    throw new Exception("Sign In Error");
  }
}

Future<void> signOut() async {
  try {
    FirebaseAuth.instance.signOut();
  } catch(e) {
    print(e);
  }
}