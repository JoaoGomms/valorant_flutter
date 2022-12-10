import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_flutter/app/map/services/map_service.dart';

class MockDio extends Mock implements Dio {}

main() {
  Dio dio = MockDio();
  MapService service = MapService(dio);

  test('should return a list of Maps from valorant api when success', () async {
    var path = '/maps';
    var mockName = 'Ascent';
    var mockImageUrl =
        'https://media.valorant-api.com/maps/7eaecc1b-4337-bbf6-6ab9-04b8f06b3319/displayicon.png';
    var mockMiniMapImageUrl =
        'https://media.valorant-api.com/maps/7eaecc1b-4337-bbf6-6ab9-04b8f06b3319/splash.png';

    when(() => dio.get(any())).thenAnswer((invocation) async => Response(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {
              "status": 200,
              "data": [
                {
                  "displayName": mockName,
                  "displayIcon": mockMiniMapImageUrl,
                  "splash": mockImageUrl,
                }
              ]
            }));

    final response = await service.fetchMaps();

    expect(response.first.name, mockName);
    expect(response.first.imageUrl, mockImageUrl);
    expect(response.first.miniMapImageUrl, mockMiniMapImageUrl);
  });
}
