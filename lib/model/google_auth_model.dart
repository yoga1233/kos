import 'package:equatable/equatable.dart';

class GoogleAuthModel extends Equatable {
  final String id;
  final String name;
  final String email;

  const GoogleAuthModel({
    this.id = '',
    this.email = '',
    this.name = '',
  });

  @override
  List<Object?> get props => throw [
        id,
        email,
        name,
      ];
}
