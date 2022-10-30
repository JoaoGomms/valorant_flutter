import 'package:mobx/mobx.dart';
import 'package:valorant_flutter/app/models/agent.dart';
import 'package:valorant_flutter/app/services/valorant_service.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ValorantService service;

  _HomeControllerBase(this.service);

  @observable
  ObservableList<Agent> agents = ObservableList();

  @action
  Future<void> fetchAgents() async {
    var agentsResponse = await service.getValorantAgents();

    agents.addAll(agentsResponse);
  }
}
