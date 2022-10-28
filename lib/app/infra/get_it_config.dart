import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/services/valorant_service.dart';

import '../controllers/home_controller.dart';

class GetItConfig {
  GetIt sl = GetIt.instance;

  void registerDio() {
    sl.registerSingleton<Dio>(
        Dio(BaseOptions(
          baseUrl: 'https://valorant-api.com/v1',
        )),
        instanceName: 'valorantDioClient');
  }

  void registerControllers() {
    sl.registerSingleton<ValorantService>(ValorantService(GetIt.I<Dio>()));
    sl.registerSingleton<HomeController>(HomeController(GetIt.I()));
  }
}
