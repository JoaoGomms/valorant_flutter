import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_flutter/app/agent/models/agent_model.dart';
import 'package:valorant_flutter/app/agent/services/agent_service.dart';

class FakeAgent with Fake implements AgentModel {}

class MockDio extends Mock implements Dio {}

var agentServiceMockResponse = {
  'displayName': 'Name',
  'description': 'Description',
  'bustPortrait': 'Portrait',
  'role': {
    'displayName': 'RoleName',
    'description': 'RoleDescription',
    'displayIcon': 'RoleIcon',
  },
  'backgroundGradientColors': ['ffffff', '222222'],
  'abilities': [
    {
      'slot': '1',
      'displayName': 'RoleName',
      'description': 'RoleDescription',
      'displayIcon': 'RoleIcon',
    }
  ],
};

void main() {
  late Dio dio;
  late AgentService service;

  setUp(() {
    dio = MockDio();
    service = AgentService(dio);
  });

  test('Should return a list of agents when successful', () async {
    // arrange
    when(() => dio.get(any(), queryParameters: {'isPlayableCharacter': true, 'language': 'pt-BR'}))
        .thenAnswer((_) async => Response(requestOptions: RequestOptions(path: ''), statusCode: 200, data: {
              'data': [agentServiceMockResponse]
            }));
    // act
    final response = await service.getValorantAgents();

    verify(() => dio.get('/agents', queryParameters: {'isPlayableCharacter': true, 'language': 'pt-BR'})).called(1);
    expect(response.first, isA<AgentModel>());
    expect(response.first.name, agentServiceMockResponse['displayName']);
    expect(response.first.description, agentServiceMockResponse['description']);
    // assert
  });
}
