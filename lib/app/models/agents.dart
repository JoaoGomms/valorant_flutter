class Agents {
  final String name;
  final String description;

  Agents({required this.description, required this.name});

  factory Agents.fromJson(Map<String, dynamic> json) => Agents(
      name: json['displayName'] ?? '', description: json['description'] ?? '');

  String toString() {
    return 'Agent: $name, Description $description';
  }
}
