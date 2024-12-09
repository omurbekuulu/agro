
class DirectionModel {
  final int? id;
  final String? name;
  final int? categoryId;

  DirectionModel({
    required this.id,
    required this.name,
    required this.categoryId,
  });

factory DirectionModel.fromJson(Map<String, dynamic> json) {
    return DirectionModel(
      id: json['id'],
      name: json['name'],
      categoryId: json['categoryId'],
    );
  }
}
