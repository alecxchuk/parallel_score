import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  // Reference to firebase instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future? loginWithEmail(
      {required String email, required String password}) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      print('$authResult lol');
      // return user != null;
      return {"success": authResult.user != null, "user": authResult.user};
    } catch (e) {
      return {"success": false, "message": e};
    }
  }

  Future? signUpWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      print('$authResult lol');
      print('${authResult.user!.email} lol');
      print('${authResult.user!.uid} lol');
      authResult.user!.updateDisplayName(name);
      authResult.user!.updatePhotoURL(
          'https://thumbs.dreamstime.com/z/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg');

      return {"success": authResult.user != null, "user": authResult.user};
    } catch (e) {
      print('$e loal');
      return {"success": false, "message": e};
    }
  }

  Future? googleSignIn() async {
    try {
      // await _firebaseAuth.
    } catch (e) {}
  }
}
