import 'package:flutter/material.dart';
import 'package:valorant_flutter/app/agent/models/role_model.dart';
import 'package:valorant_flutter/extensions/string_to_color.dart';

import 'abilitiy_model.dart';

class AgentModel {
  final String name;
  final String description;
  final String imageUrl;
  final RoleModel role;
  final List<AbilityModel> abilities;
  final List<Color> gradientColors;

  AgentModel({
    required this.description,
    required this.name,
    required this.imageUrl,
    required this.role,
    required this.gradientColors,
    required this.abilities,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        name: json['displayName'] ?? '',
        description: json['description'] ?? '',
        imageUrl: json['bustPortrait'] ?? '',
        role: RoleModel.fromJson(json['role']),
        gradientColors: (json['backgroundGradientColors'] as List).isNotEmpty
            ? (json['backgroundGradientColors'] as List).map((e) => (e as String).toColor()).toList()
            : [],
        abilities: (json['abilities'] as List).isNotEmpty
            ? (json['abilities'] as List).map((e) => AbilityModel.fromJson(e)).toList()
            : [],
      );

  @override
  String toString() {
    return 'Agent: $name, Description $description';
  }
}
