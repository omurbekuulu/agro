class BreedModel {
  final int id;
  final String name;
  final String description;

  BreedModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    return BreedModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
