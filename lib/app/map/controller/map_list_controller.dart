import 'package:mobx/mobx.dart';
import 'package:valorant_flutter/app/map/services/map_service.dart';

import '../models/map_model.dart';

part 'map_list_controller.g.dart';

class MapListController = _MapListControllerBase with _$MapListController;

abstract class _MapListControllerBase with Store {
  final MapService service;

  _MapListControllerBase(this.service);

  @observable
  ObservableList<MapModel> mapsList = ObservableList();

  @action
  Future<void> fetchMapList() async {
    final mapListFromApi = await service.fetchMaps();
    mapsList.addAll(mapListFromApi);
  }
}
