class RoleModel {
  final String name;
  final String description;
  final String iconUrl;

  RoleModel({required this.name, required this.description, required this.iconUrl});

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
      name: json['displayName'] ?? '', description: json['description'] ?? '', iconUrl: json['displayIcon'] ?? '');
}
