import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kos/model/favorite_model.dart';
import 'package:kos/model/space_model.dart';
import 'package:kos/service/favorite_service.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  void addFavorite(FavoriteModel favorite) async {
    try {
      emit(FavoriteLoading());
      await FavoriteService().createFavorite(favorite);
      emit(FavoriteSuccess());
    } catch (e) {
      emit(FavoriteFailed(e.toString()));
    }
  }
}
