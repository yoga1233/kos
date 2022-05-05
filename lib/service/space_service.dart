import 'package:dio/dio.dart';
import 'package:kos/model/space_model.dart';

class Service {
  Future<List<SpaceModel>> getData() async {
    try {
      var response =
          await Dio().get('http://bwa-cozy.herokuapp.com/recommended-spaces');
      if (response.statusCode == 200) {
        List data = response.data;
        List<SpaceModel> space =
            data.map((item) => SpaceModel.fromJson(item)).toList();
        return space;
      } else {
        return <SpaceModel>[];
      }
    } catch (e) {
      rethrow;
    }
  }
}
