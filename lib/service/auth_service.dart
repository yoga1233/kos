import 'package:firebase_auth/firebase_auth.dart';
import 'package:kos/model/user_model.dart';
import 'package:kos/service/user_service.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
      );

      await UserService().setUser(user);
      return user;
    } on FirebaseAuthException catch (e) {
      print('eror = $e.message');
      if (e.message ==
          'The email address is already in use by another account.') {
        throw 'Email sudah pernah digunakan';
      }
      if (e.message == 'Given String is empty or null') {
        throw 'Pastikan semua form terisi ';
      }
      print(e);
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user =
          await UserService().getUserById(userCredential.user!.uid);
      return user;
    } on FirebaseException catch (e) {
      print(e.message);
      if (e.message ==
          'There is no user record corresponding to this identifier. The user may have been deleted.') {
        throw 'Email tidak terdaftar, Silahkan register akun anda';
      } else if (e.message ==
          'The password is invalid or the user does not have a password.') {
        throw 'Password salah';
      } else if (e.message == "Given String is empty or null") {
        throw 'Fill given form.';
      } else {
        throw 'Error tidak diketahui ${e.message}';
      }
    }
  }
}
