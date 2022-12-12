import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_flutter/app/agent/models/agent_model.dart';
import 'package:valorant_flutter/app/agent/services/agent_service.dart';

class FakeAgent with Fake implements AgentModel {}

class MockDio extends Mock implements Dio {}

void main() {
  Dio dio = MockDio();
  AgentService service = AgentService(dio);

  test('Should return a list of agents', () async {
    var path = '/agents';

    when(() => dio.get(any(),
            queryParameters: {'isPlayableCharacter': any(), 'language': any()}))
        .thenAnswer((_) async => Response(
                requestOptions: RequestOptions(path: path),
                statusCode: 200,
                data: {
                  'data': [FakeAgent()]
                }));

    final response = await service.getValorantAgents();

    for (var agent in response) {
      print(response.toString());
    }
  });
}
