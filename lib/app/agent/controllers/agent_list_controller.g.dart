// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AgentListController on _AgentListControllerBase, Store {
  late final _$agentsAtom = Atom(name: '_AgentListControllerBase.agents', context: context);

  @override
  ObservableList<Agent> get agents {
    _$agentsAtom.reportRead();
    return super.agents;
  }

  @override
  set agents(ObservableList<Agent> value) {
    _$agentsAtom.reportWrite(value, super.agents, () {
      super.agents = value;
    });
  }

  late final _$fetchAgentsAsyncAction = AsyncAction('_AgentListControllerBase.fetchAgents', context: context);

  @override
  Future<void> fetchAgents() {
    return _$fetchAgentsAsyncAction.run(() => super.fetchAgents());
  }

  @override
  String toString() {
    return '''
agents: ${agents}
    ''';
  }
}
