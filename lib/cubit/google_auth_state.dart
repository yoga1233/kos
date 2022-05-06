part of 'google_auth_cubit.dart';

abstract class GoogleAuthState extends Equatable {
  const GoogleAuthState();

  @override
  List<Object> get props => [];
}

class GoogleAuthInitial extends GoogleAuthState {}

class GoogleAuthLoading extends GoogleAuthState {}

class GoogleAuthSuccess extends GoogleAuthState {
  // final List<GoogleAuthModel> user;
  // const GoogleAuthSuccess(this.user);
  // @override
  // List<Object> get props => [user];
}

class GoogleAuthFailled extends GoogleAuthState {
  final String eror;
  const GoogleAuthFailled(this.eror);
  @override
  List<Object> get props => [eror];
}
