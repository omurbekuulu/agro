import 'package:agro/data/add_new_breed/models/breed.dart';
import 'package:agro/domain/add_new_breed/entities/breed.dart';

class BreedMapper {
  static BreedEntity toEntity(BreedModel model) {
    return BreedEntity(
      id: model.id,
      name: model.name,
      categoryId: model.categoryId,
      description: model.description,
    );
  }
}
