import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:valorant_flutter/app/map/services/map_service.dart';

class MockDio extends Mock implements Dio {}

main() {
  Dio dio = MockDio();
  MapService service = MapService(dio);

  test('should return a list of Maps from valorant api', () async {

    when(() => dio.get('https://valorant-api.com/v1/maps')).thenAnswer((invocation) async => Response(requestOptions: RequestOptions.c ));

    final response = await service.fetchMaps();
    expect(response., matcher)
  });
}
