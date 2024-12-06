import 'package:agro/data/add_new_breed/models/season.dart';
import 'package:agro/domain/add_new_breed/entities/season.dart';

class SeasonMapper {
  static SeasonEntity toEntity(SeasonModel model) {
    return SeasonEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      recommendations: model.recommendations,
    );
  }
}