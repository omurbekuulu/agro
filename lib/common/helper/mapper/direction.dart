import 'package:agro/data/directions/model/direction.dart';
import 'package:agro/domain/directions/entity/direction.dart';

class DirectionMapper {
  static DirectionEntity toEntity(DirectionModel model) {
    return DirectionEntity(
      id: model.id,
      name: model.name,
      categoryId: model.categoryId,
    );
  }
}