import 'package:dio/dio.dart';

import '../models/agent.dart';

class ValorantService {
  final Dio dio;

  ValorantService(this.dio);

  Future<List<Agent>> getValorantAgents() async {
    List<Agent> agentsList = [];
    try {
      final response = await dio
          .get('/agents', queryParameters: {'isPlayableCharacter': true});

      if (response.statusCode == 200) {
        for (var agent in response.data['data'] as List) {
          agentsList.add(Agent.fromJson(agent));
        }
      }

      return agentsList;
    } on DioError catch (dioError) {
      print(dioError);
      throw Exception();
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
