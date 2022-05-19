part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {}

class FavoriteFailed extends FavoriteState {
  final String error;
  const FavoriteFailed(this.error);
  @override
  List<Object> get props => [error];
}
