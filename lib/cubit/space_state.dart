part of 'space_cubit.dart';

abstract class SpaceState extends Equatable {
  const SpaceState();

  @override
  List<Object> get props => [];
}

class SpaceInitial extends SpaceState {}

class SpaceLoading extends SpaceState {}

class SpaceSuccess extends SpaceState {
  final List<SpaceModel> space;
  const SpaceSuccess(this.space);
  @override
  List<Object> get props => [space];
}

class SpaceFailed extends SpaceState {
  final String eror;
  const SpaceFailed(this.eror);
  @override
  List<Object> get props => [eror];
}
