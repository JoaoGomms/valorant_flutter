import 'package:valorant_flutter/app/models/role.dart';

class Agent {
  final String name;
  final String description;
  final String imageUrl;
  final Role role;
  List<dynamic> gradientColors;

  Agent(
      {required this.description,
      required this.name,
      required this.imageUrl,
      required this.role,
      required this.gradientColors});

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
      name: json['displayName'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['bustPortrait'] ?? '',
      role: Role.fromJson(json['role']),
      gradientColors: (json['backgroundGradientColors'] as List).toList());

  String toString() {
    return 'Agent: $name, Description $description';
  }
}
