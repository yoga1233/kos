import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kos/model/space_model.dart';
import 'package:kos/service/space_service.dart';

part 'space_state.dart';

class SpaceCubit extends Cubit<SpaceState> {
  SpaceCubit() : super(SpaceInitial());

  void fetchSpace() async {
    try {
      emit(SpaceLoading());
      List<SpaceModel> space = await Service().getData();
      emit(SpaceSuccess(space));
    } catch (e) {
      emit(SpaceFailed(e.toString()));
    }
  }
}
