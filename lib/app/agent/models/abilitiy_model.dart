class AbilityModel {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  AbilityModel({required this.slot, required this.displayName, required this.description, required this.displayIcon});

  factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
      slot: json['slot'] ?? '',
      displayName: json['displayName'] ?? '',
      description: json['description'] ?? '',
      displayIcon: json['displayIcon'] ?? '');
}
