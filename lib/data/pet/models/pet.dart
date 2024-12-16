class PetModel {
  final int userId;
  final int breedId;
  final int directionId;
  final int quantity;
  final int animalMonths;

  PetModel({
    required this.userId,
    required this.breedId,
    required this.directionId,
    required this.quantity,
    required this.animalMonths,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      userId: json['userId'],
      breedId: json['breedId'],
      directionId: json['directionId'],
      quantity: json['quantity'],
      animalMonths: json['animalMonths'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'breedId': breedId,
      'directionId': directionId,
      'quantity': quantity,
      'month': animalMonths,
    };
  }
}
