import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_flutter/app/tiers/services/tier_service.dart';

class MockDio extends Mock implements Dio {}

main() {
  Dio dio = MockDio();
  TierService service = TierService(dio);

  test('should return a list of competitive tiers from valorant api when success', () async {
    var path = '/competitivetiers';
    Map<String, dynamic> mockTierModelAttributes = {
      'tierName': 'UNRANKED',
      'divisionName': 'UNRANKED',
      'color': 'ffffffff',
      'backgroundColor': '00000000',
      'largeIcon':
          'https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/0/largeicon.png',
    };

    when(() => dio.get(any()))
        .thenAnswer((invocation) async => Response(requestOptions: RequestOptions(path: path), statusCode: 200, data: {
              "status": 200,
              "data": [
                {
                  "uuid": "1",
                  "assetObjectName": "Episode1",
                  "tiers": [
                    mockTierModelAttributes,
                  ]
                }
              ]
            }));

    final response = await service.getTiers();

    expect(response.first.tierName, mockTierModelAttributes['tierName']);
    expect(response.first.divisionName, mockTierModelAttributes['divisionName']);
    expect(response.first.hexColor, mockTierModelAttributes['color']);
    expect(response.first.hexBackgroundColor, mockTierModelAttributes['backgroundColor']);
    expect(response.first.iconUrl, mockTierModelAttributes['largeIcon']);
  });
}
