import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kos/model/google_auth_model.dart';

class GoogleAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get account => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return _user = googleUser;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await auth.signInWithCredential(credential);
      User userGoogle = auth.currentUser!;
      GoogleAuthModel user = GoogleAuthModel(
        id: userGoogle.uid,
        name: userGoogle.displayName.toString(),
        email: userGoogle.email.toString(),
      );
      print(user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future gogleSignOut() async {
    try {
      GoogleSignIn().signOut();
    } catch (e) {
      rethrow;
    }
  }
}
