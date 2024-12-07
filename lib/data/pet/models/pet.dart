class PetModel {
  final int id;
  final int userId;
  final int breedId;
  final int directionId;
  final int quantity;
  final int animalMonths;

  PetModel({
    required this.id,
    required this.userId,
    required this.breedId,
    required this.directionId,
    required this.quantity,
    required this.animalMonths,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'],
      userId: json['userId'],
      breedId: json['breedId'],
      directionId: json['directionId'],
      quantity: json['quantity'],
      animalMonths: json['animalMonths'],
    );
  }
}
