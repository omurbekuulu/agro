import 'package:agro/data/breeds/models/breed.dart';
import 'package:agro/domain/breeds/entities/breed.dart';

class BreedMapper {
  static BreedEntity toEntity(BreedModel model) {
    return BreedEntity(
      id: model.id,
      name: model.name,
      description: model.description,
    );
  }
}
