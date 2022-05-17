import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kos/model/user_model.dart';
import 'package:kos/service/user_service.dart';

class GoogleAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future googleLogin({required BuildContext context}) async {
    final googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    if (googleUser == null) return null;

    try {
      await auth.signInWithCredential(credential);
      User userGoogle = auth.currentUser!;

      await UserService().checkUserById(
        userGoogle.uid,
        userGoogle.displayName!,
        userGoogle.email!,
      );
      UserModel user = await UserService().getUserById(
        userGoogle.uid,
      );
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future gogleSignOut() async {
    try {
      await googleSignIn.signOut();
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
