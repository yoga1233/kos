import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kos/model/favorite_model.dart';

class FavoriteService {
  final CollectionReference _favoriteReference =
      FirebaseFirestore.instance.collection('favorites');

  Future<void> createFavorite(FavoriteModel favorite) async {
    try {
      _favoriteReference.add({
        'favorite': favorite.space.toJson(),
        'email': favorite.email,
      });
    } catch (e) {
      rethrow;
    }
  }
}
