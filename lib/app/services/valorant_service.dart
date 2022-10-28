import 'package:dio/dio.dart';

import '../models/agents.dart';

class ValorantService {
  final Dio dio;

  ValorantService(this.dio);

  Future<List<Agents>> getValorantAgents() async {
    List<Agents> agentsList = [];
    try {
      final response = await dio.get('/agents');

      if (response.statusCode == 200) {
        for (var agent in response.data['data'] as List) {
          agentsList.add(Agents.fromJson(agent));
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
