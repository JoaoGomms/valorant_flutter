import 'package:mobx/mobx.dart';
import 'package:valorant_flutter/app/agent/services/agent_service.dart';

import '../models/map_model.dart';

part 'map_list_controller.g.dart';

class MapListController = _MapListControllerBase with _$MapListController;

abstract class _MapListControllerBase with Store {
  final AgentService service;

  _MapListControllerBase(this.service);

  @observable
  ObservableList<MapModel> mapsList = ObservableList();

  @action
  void fetchMapList() {
    mapsList.add(MapModel('Mapa Nome', 'Imagem url', "Minimapa url"));
  }
}
