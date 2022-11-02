class Ability {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  Ability(
      {required this.slot,
      required this.displayName,
      required this.description,
      required this.displayIcon});

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
      slot: json['slot'] ?? '',
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '');
}
