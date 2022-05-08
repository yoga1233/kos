import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kos/model/user_model.dart';
import 'package:kos/service/user_service.dart';

class GoogleAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      await auth.signInWithCredential(credential);
      User userGoogle = auth.currentUser!;
      UserModel user = UserModel(
        id: userGoogle.uid,
        name: userGoogle.displayName.toString(),
        email: userGoogle.email.toString(),
      );
      await UserService().checkUserById(
        userGoogle.uid,
        userGoogle.displayName!,
        userGoogle.email!,
      );
      print('user data service $user');
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future gogleSignOut() async {
    try {
      await googleSignIn.signOut();
      await auth.signOut();
      if (auth.currentUser != null) {
        print('gagal log out');
      } else {
        print('berhasil logout');
      }
    } catch (e) {
      rethrow;
    }
  }
}
