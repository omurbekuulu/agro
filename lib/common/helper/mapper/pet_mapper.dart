import 'package:agro/data/pet/models/pet.dart';
import 'package:agro/domain/pet/entities/pet.dart';

class PetMapper {
  static PetEntity toEntity(PetModel model) {
    return PetEntity(
      id: model.id,
      breedId: model.breedId,
      directionId: model.directionId,
      quantity: model.quantity,
      animalMonths: model.animalMonths,
    );
  }

  static PetModel toModel(PetEntity entity) {
    return PetModel(
      breedId: entity.breedId,
      directionId: entity.directionId,
      quantity: entity.quantity,
      animalMonths: entity.animalMonths,
    );
  }
}