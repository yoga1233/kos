import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;

  const UserModel({
    this.id = '',
    this.email = '',
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
      ];
}
