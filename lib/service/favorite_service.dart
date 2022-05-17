import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kos/model/favorite_model.dart';

class FavoriteService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('favorite');

  Future<void> setFavorite(FavoriteModel favorite) async {
    try {
      _userReference.doc(favorite.email).set({
        'favId': favorite.favId,
      });
    } catch (e) {}
  }
}
