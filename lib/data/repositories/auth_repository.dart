import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user');
      }
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                // firestore
                //     .collection('users')
                //     .doc(_firebaseAuth.currentUser!.uid)
                //     .set({
                //   "userName": userName,
                //   "email": email,
                // }),
              });
    } on FirebaseAuthException catch (e) {
      print("Error, $e");
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  getCurrentUser() async {
    var currentUser = _firebaseAuth.currentUser;
    var user = {
      "email": currentUser!.email,
      "name": currentUser.email,
    };
    return user;
  }
}
