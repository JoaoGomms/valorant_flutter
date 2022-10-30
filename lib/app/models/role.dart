class Role {
  final String name;
  final String description;
  final String iconUrl;

  Role({required this.name, required this.description, required this.iconUrl});

  factory Role.fromJson(Map<String, dynamic> json) => Role(
      name: json['displayName'] ?? '',
      description: json['description'],
      iconUrl: json['displayIcon']);
}
