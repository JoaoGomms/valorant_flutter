import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/agent_model.dart';

class AgentService {
  final Dio dio;

  AgentService(this.dio);

  Future<List<AgentModel>> getValorantAgents() async {
    List<AgentModel> agentsList = [];
    try {
      final response = await dio.get('/agents', queryParameters: {'isPlayableCharacter': true, 'language': 'pt-BR'});

      if (response.statusCode == 200) {
        for (var agent in response.data['data'] as List) {
          agentsList.add(AgentModel.fromJson(agent));
        }
      }

      return agentsList;
    } on DioError catch (e) {
      log(e.message);
      throw Exception('Dio Error');
    } catch (e) {
      throw Exception('Unexpected Error');
    }
  }
}
