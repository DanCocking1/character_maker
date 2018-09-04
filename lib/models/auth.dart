import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

abstract class BaseAuth{
  Future<String> signInWithEmailandPassword(String _email, String _password);
  Future<String> signInWithGoogle();
  Future<String>createUserWithEmailandPassword(String _email, String _password);
  Future<String>currentUser();
  Future<void> signOut();
  Future<FirebaseUser> fBuser();
}

class Auth implements BaseAuth{
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> signInWithEmailandPassword(String _email, String _password) async{
    FirebaseUser user =
    await
    FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    return user.uid;
  }

  Future<String> createUserWithEmailandPassword(String _email, String _password) async{
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _password);
    return user.uid;
  }

  Future<String> signInWithGoogle() async{

    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication
    = await googleSignInAccount.authentication;

    FirebaseUser user = await _firebaseAuth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    return user.uid;
  }
  Future<String> currentUser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }
  Future<FirebaseUser> fBuser() async{
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}