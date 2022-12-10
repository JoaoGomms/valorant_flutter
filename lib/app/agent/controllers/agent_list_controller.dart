import 'package:mobx/mobx.dart';

import '../enums/agents_roles_enum.dart';
import '../models/agent_model.dart';
import '../services/agent_service.dart';

part 'agent_list_controller.g.dart';

class AgentListController = _AgentListControllerBase with _$AgentListController;

abstract class _AgentListControllerBase with Store {
  final AgentService service;

  _AgentListControllerBase(this.service);

  @observable
  ObservableList<AgentModel> agents = ObservableList();

  List<AgentModel> get controllerAgents =>
      agents.where((agent) => agent.role.name == AgentRoles.controller.roleName).toList();

  List<AgentModel> get duelistAgents =>
      agents.where((agent) => agent.role.name == AgentRoles.duelist.roleName).toList();

  List<AgentModel> get initiatorAgents =>
      agents.where((agent) => agent.role.name == AgentRoles.initiator.roleName).toList();

  List<AgentModel> get sentinelAgents =>
      agents.where((agent) => agent.role.name == AgentRoles.sentinel.roleName).toList();

  @action
  Future<void> fetchAgents() async {
    var agentsResponse = await service.getValorantAgents();

    agents.addAll(agentsResponse);
  }
}
