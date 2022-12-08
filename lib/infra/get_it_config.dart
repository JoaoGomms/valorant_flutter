import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/agent/services/agent_service.dart';
import 'package:valorant_flutter/app/map/controller/map_list_controller.dart';

import '../app/agent/controllers/agent_list_controller.dart';
import '../app/map/services/map_service.dart';

class GetItConfig {
  GetIt sl = GetIt.instance;

  void initGetIt() {
    registerDio();
    registerControllers();
    registerServices();
  }

  void registerDio() {
    sl.registerFactory<Dio>(
        () => Dio(BaseOptions(
              baseUrl: 'https://valorant-api.com/v1',
            )),
        instanceName: 'valorantDioClient');
  }

  void registerControllers() {
    sl.registerFactory<AgentListController>(
        () => AgentListController(GetIt.I()));
    sl.registerFactory<MapListController>(() => MapListController(GetIt.I()));
  }

  void registerServices() {
    Dio valorantDioInstance = GetIt.I<Dio>(instanceName: 'valorantDioClient');

    sl.registerFactory<AgentService>(() => AgentService(valorantDioInstance));
    sl.registerFactory<MapService>(() => MapService(valorantDioInstance));
  }
}
