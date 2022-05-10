import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kos/model/user_model.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('user');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkUserById(String id, String name, String email) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();

      if (snapshot.exists) {
        getUserById(id);
      } else {
        UserModel user = UserModel(
          id: id,
          email: email,
          name: name,
        );
        await setUser(user);
      }
      return true;
    } catch (e) {
      throw Exception('Error check email by id $e');
    }
  }
}
