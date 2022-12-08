import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:valorant_flutter/app/map/models/map_model.dart';

class MapService {
  final Dio dio;

  MapService(this.dio);

  Future<List<MapModel>> fetchMaps() async {
    List<MapModel> mapModelList = [];
    try {
      final response = await dio.get('/maps');

      if (response.statusCode == 200) {
        for (var map in response.data['data']) {
          mapModelList.add(MapModel.fromJson(map));
        }
        return mapModelList;
      }
      return [];
    } on DioError catch (error) {
      log(error.message);
      throw Exception(error);
    } catch (e) {
      throw Exception(e);
    }
  }
}
