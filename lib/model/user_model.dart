import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final int idfav;

  const UserModel({
    this.id = '',
    this.email = '',
    this.name = '',
    this.idfav = 0,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        idfav,
      ];
}
