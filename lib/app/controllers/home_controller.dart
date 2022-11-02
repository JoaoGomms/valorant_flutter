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

  @observable
  List<Agent> get controllerAgents =>
      agents.where((agent) => agent.role.name == 'Controller').toList();

  @observable
  List<Agent> get duelistAgents =>
      agents.where((agent) => agent.role.name == 'Duelist').toList();

  @observable
  List<Agent> get initiatorAgents =>
      agents.where((agent) => agent.role.name == 'Initiator').toList();

  @observable
  List<Agent> get sentinelAgents =>
      agents.where((agent) => agent.role.name == 'Sentinel').toList();

  @action
  Future<void> fetchAgents() async {
    var agentsResponse = await service.getValorantAgents();

    agents.addAll(agentsResponse);
  }
}
