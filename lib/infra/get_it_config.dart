import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:valorant_flutter/app/agent/services/agent_service.dart';

import '../app/agent/controllers/agent_list_controller.dart';

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
    sl.registerFactory<AgentService>(() => AgentService(GetIt.I<Dio>(instanceName: 'valorantDioClient')));
    sl.registerFactory<AgentListController>(() => AgentListController(GetIt.I()));
  }
}
