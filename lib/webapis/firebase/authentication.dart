import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Future<User?> signinWithEmailAndPassword(String email, String password) async {
  UserCredential userCredential =
      await auth.signInWithEmailAndPassword(email: email, password: password);
  User? user = userCredential.user;
  return Future(() => user);
}

Future<void> sendNameToFirebase(String name, String uid, String email) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore
      .collection('users')
      .doc(uid)
      .set({'user_name': name, 'email': email});
}

Future<User?> signupWithEmailAndPassword(
    String email, String password, String name) async {
  UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email, password: password);
  User? user = credential.user;
  if (user != null) {
    await sendNameToFirebase(name, user.uid, email);
  }
  return Future(() => credential.user);
}

Future<void> forgotPassword(String email) async {
  return await auth.sendPasswordResetEmail(email: email);
}

Future signout() async {
  await auth.signOut();
}
