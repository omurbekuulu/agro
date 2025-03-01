class PetEntity {
  final int? id;
  final int breedId;
  final int directionId;
  final int quantity;
  final int animalMonths;

  PetEntity({
    this.id,
    required this.breedId,
    required this.directionId,
    required this.quantity,
    required this.animalMonths,
  });
}
