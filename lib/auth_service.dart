import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
// Google Sign In
  Future getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  getProfileImage() {
    if (FirebaseAuth.instance.currentUser?.photoURL != null) {
      return NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!);
    } else {
      return Icon(
        Icons.account_circle,
        size: 100,
        color: Colors.white,
      );
    }
  }

  getUserName() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Name, email address, and profile photo URL
      final name = user.displayName;
      // Check if user's email is verified
      final emailVerified = user.emailVerified;

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      final uid = user.uid;
      return name;
    }
  }

  getUserEmail() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final email = user.email;
      // Check if user's email is verified
      final emailVerified = user.emailVerified;

      return email;
    }
  }

  signInWithGoogle() async {
// begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signInSilently();
// obtaiin auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
// create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
// finally, lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
