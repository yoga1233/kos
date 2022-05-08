import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kos/model/user_model.dart';
import 'package:kos/service/google_auth_service.dart';

part 'google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitial());

  Future signIn() async {
    try {
      emit(GoogleAuthLoading());
      UserModel user = await GoogleAuthService().googleLogin();

      emit(GoogleAuthSuccess(user));
    } catch (e) {
      emit(GoogleAuthFailled(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(GoogleAuthLoading());
      GoogleAuthService().gogleSignOut();
      emit(GoogleAuthInitial());
    } catch (e) {
      emit(GoogleAuthFailled(e.toString()));
    }
  }
}
