class BreedEntity {
  final int id;
  final String name;
  String? categoryId;
  final String description;

  BreedEntity({
    required this.id,
    required this.name,
    this.categoryId,
    required this.description,
  });
}
