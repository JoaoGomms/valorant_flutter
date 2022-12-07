import 'package:mobx/mobx.dart';

import '../../agent/enums/agents_roles_enum.dart';
import '../../agent/models/agent.dart';
import '../../agent/services/agent_service.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AgentService service;

  _HomeControllerBase(this.service);

  @observable
  ObservableList<Agent> agents = ObservableList();

  List<Agent> get controllerAgents => agents
      .where((agent) => agent.role.name == AgentRoles.controller.roleName)
      .toList();

  List<Agent> get duelistAgents => agents
      .where((agent) => agent.role.name == AgentRoles.duelist.roleName)
      .toList();

  List<Agent> get initiatorAgents => agents
      .where((agent) => agent.role.name == AgentRoles.initiator.roleName)
      .toList();

  List<Agent> get sentinelAgents => agents
      .where((agent) => agent.role.name == AgentRoles.sentinel.roleName)
      .toList();

  @action
  Future<void> fetchAgents() async {
    var agentsResponse = await service.getValorantAgents();

    agents.addAll(agentsResponse);
  }
}
