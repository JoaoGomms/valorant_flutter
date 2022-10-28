import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DioConfig {
  void registerValorantDioClient() {
    GetIt.I.registerFactory(
        () => Dio(BaseOptions(
              baseUrl: 'https://valorant-api.com/v1',
            )),
        instanceName: 'valorantDioClient');
  }
}
