import 'package:equatable/equatable.dart';
import 'package:kos/model/space_model.dart';

class FavoriteModel extends Equatable {
  final String email;
  final SpaceModel space;

  const FavoriteModel({this.email = '', required this.space});

  @override
  List<Object?> get props => [
        email,
        space,
      ];
}
