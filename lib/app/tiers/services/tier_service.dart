import 'package:dio/dio.dart';
import 'package:valorant_flutter/app/tiers/models/tier_model.dart';

class TierService {
  final Dio dio;

  TierService(this.dio);

  Future<List<TierModel>> getTiers() async {
    List<TierModel> tierList = [];
    try {
      final response = await dio.get('/competitivetiers');

      List<dynamic> listOfLastEpisodeTiers = ((response.data['data'] as List).last)['tiers'];

      for (var tier in listOfLastEpisodeTiers) {
        tierList.add(TierModel.fromJson(tier));
      }

      return tierList;
    } catch (e) {
      rethrow;
    }
  }
}
