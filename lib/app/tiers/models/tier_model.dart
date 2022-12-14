class TierModel {
  final String tierName;
  final String divisionName;
  final String hexColor;
  final String hexBackgroundColor;
  final String iconUrl;

  TierModel(
      {required this.tierName,
      required this.divisionName,
      required this.hexColor,
      required this.hexBackgroundColor,
      required this.iconUrl});

  factory TierModel.fromJson(Map<String, dynamic> json) {
    return TierModel(
        tierName: json['tierName'] ?? '',
        divisionName: json['divisionName'] ?? '',
        hexColor: json['color'] ?? '',
        hexBackgroundColor: json['backgroundColor'] ?? '',
        iconUrl: json['smallIcon'] ?? '');
  }
}
