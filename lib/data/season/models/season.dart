class SeasonModel {
  final int? id;
  final String? name;
  final String? description;
  final List<dynamic>? recommendations;

  SeasonModel({
    required this.id,
    required this.name,
    required this.description,
    required this.recommendations,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      recommendations: json['recommendations'] 
    );
  }
}
