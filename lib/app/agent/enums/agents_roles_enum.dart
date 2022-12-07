enum AgentRoles {
  initiator('Iniciador'),
  controller('Controlador'),
  duelist('Duelista'),
  sentinel('Sentinela');

  final String roleName;

  const AgentRoles(this.roleName);
}
