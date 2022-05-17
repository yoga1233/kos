import 'package:equatable/equatable.dart';

class FavoriteModel extends Equatable {
  final String email;
  final int favId;

  const FavoriteModel({this.email = '', this.favId = 0});

  @override
  List<Object?> get props => [
        email,
        favId,
      ];
}
