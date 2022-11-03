import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/extensions/string_to_color.dart';
import 'package:valorant_flutter/app/models/abilitiy.dart';
import 'package:valorant_flutter/app/models/role.dart';

class Agent {
  final String name;
  final String description;
  final String imageUrl;
  final Role role;
  final List<Ability> abilities;
  final List<Color> gradientColors;

  Agent({
    required this.description,
    required this.name,
    required this.imageUrl,
    required this.role,
    required this.gradientColors,
    required this.abilities,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        name: json['displayName'] ?? '',
        description: json['description'] ?? '',
        imageUrl: json['bustPortrait'] ?? '',
        role: Role.fromJson(json['role']),
        gradientColors: (json['backgroundGradientColors'] as List).isNotEmpty
            ? (json['backgroundGradientColors'] as List)
                .map((e) => (e as String).toColor())
                .toList()
            : [],
        abilities: (json['abilities'] as List).isNotEmpty
            ? (json['abilities'] as List)
                .map((e) => Ability.fromJson(e))
                .toList()
            : [],
      );

  @override
  String toString() {
    return 'Agent: $name, Description $description';
  }
}
