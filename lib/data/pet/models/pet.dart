class PetModel {
  final int? id;
  final int? userId;
  final int breedId;
  final int directionId;
  final int quantity;
  final int animalMonths;

  PetModel({
    this.id,
    this.userId,
    required this.breedId,
    required this.directionId,
    required this.quantity,
    required this.animalMonths,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'],
      userId: json['userId'],
      breedId: json['sectionsId'],
      directionId: json['directionId'],
      quantity: json['quantity'],
      animalMonths: json['animaMonth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sectionsId': breedId,
      'directionId': directionId,
      'quantity': quantity,
      'month': animalMonths,
    };
  }
}
