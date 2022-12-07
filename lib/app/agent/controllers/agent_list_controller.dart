import 'package:mobx/mobx.dart';

import '../enums/agents_roles_enum.dart';
import '../models/agent.dart';
import '../services/agent_service.dart';

part 'agent_list_controller.g.dart';

class AgentListController = _AgentListControllerBase with _$AgentListController;

abstract class _AgentListControllerBase with Store {
  final AgentService service;

  _AgentListControllerBase(this.service);

  @observable
  ObservableList<Agent> agents = ObservableList();

  List<Agent> get controllerAgents =>
      agents.where((agent) => agent.role.name == AgentRoles.controller.roleName).toList();

  List<Agent> get duelistAgents => agents.where((agent) => agent.role.name == AgentRoles.duelist.roleName).toList();

  List<Agent> get initiatorAgents => agents.where((agent) => agent.role.name == AgentRoles.initiator.roleName).toList();

  List<Agent> get sentinelAgents => agents.where((agent) => agent.role.name == AgentRoles.sentinel.roleName).toList();

  @action
  Future<void> fetchAgents() async {
    var agentsResponse = await service.getValorantAgents();

    agents.addAll(agentsResponse);
  }
}
