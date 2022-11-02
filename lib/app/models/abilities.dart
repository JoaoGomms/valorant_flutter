class Abilities {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  Abilities(
      {required this.slot,
      required this.displayName,
      required this.description,
      required this.displayIcon});

  factory Abilities.fromJson(Map<String, dynamic> json) => Abilities(
      slot: json['slot'] ?? '',
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '');
}
