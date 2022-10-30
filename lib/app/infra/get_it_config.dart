import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/services/valorant_service.dart';

import '../controllers/home_controller.dart';

class GetItConfig {
  GetIt sl = GetIt.instance;

  void registerDio() {
    sl.registerFactory<Dio>(
        () => Dio(BaseOptions(
              baseUrl: 'https://valorant-api.com/v1',
            )),
        instanceName: 'valorantDioClient');
  }

  void registerControllers() {
    sl.registerFactory<ValorantService>(
        () => ValorantService(GetIt.I<Dio>(instanceName: 'valorantDioClient')));
    sl.registerFactory<HomeController>(() => HomeController(GetIt.I()));
  }
}
