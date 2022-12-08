class MapModel {
  final String name;
  final String imageUrl;
  final String miniMapImageUrl;

  MapModel(this.name, this.imageUrl, this.miniMapImageUrl);

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return MapModel(json['displayName'] ?? '', json['splash'] ?? '',
        json['displayIcon'] ?? '');
  }
}
