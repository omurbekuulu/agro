import 'package:agro/data/pet/models/pet.dart';
import 'package:agro/domain/pet/entities/pet.dart';

class PetMapper {
  static PetEntity toEntity(PetModel model) {
    return PetEntity(
      id: model.id,
      userId: model.userId,
      breedId: model.breedId,
      directionId: model.directionId,
      quantity: model.quantity,
      animalMonths: model.animalMonths,
    );
  }
}