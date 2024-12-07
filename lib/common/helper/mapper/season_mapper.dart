import 'package:agro/data/season/models/season.dart';
import 'package:agro/domain/season/entities/season.dart';

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