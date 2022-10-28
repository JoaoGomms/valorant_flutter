import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/services/valorant_service.dart';

void main() {
  setUp(() {
    GetIt.I.registerFactory<Dio>(
        () => Dio(BaseOptions(
              baseUrl: 'https://valorant-api.com/v1',
            )),
        instanceName: 'valorantDioClient');
  });

  test('Should return a list of agents', () async {
    Dio valorantDioClient = GetIt.I.get<Dio>(instanceName: 'valorantDioClient');

    ValorantService valorantService = ValorantService(valorantDioClient);

    final response = await valorantService.getValorantAgents();

    for (var agent in response) {
      print(response.toString());
    }
  });
}
