import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  // instance of auth

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in with email and password
  Future<UserCredentials> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      return UserCredentials(userCredential: userCredential);
    } on FirebaseAuthException catch (e) {
      return UserCredentials(error: e);
    }
  }

  // register with email and password
  Future<UserCredentials> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return UserCredentials(userCredential: userCredential);
    } on FirebaseAuthException catch (e) {
      return UserCredentials(error: e);
    }
  }

  // sign user out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}