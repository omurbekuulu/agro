class BreedModel {
  final int? id;
  final String? name;
  final String? categoryId;
  final String? description;

  BreedModel({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.description,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    return BreedModel(
      id: json['id'],
      name: json['name'],
      categoryId: json['categoryId'],
      description: json['description'],
    );
  }
}
