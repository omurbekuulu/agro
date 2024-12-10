import 'package:agro/data/recommendation/model/recommentation.dart';

import '../../../domain/recommendation/entity/recommentation.dart';

class CardMapper {
  static CardEntity toEntity(CardModel model) {
    return CardEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      recommendations: model.recommendations
          .map((recommendation) =>
              RecommendationMapper.toEntity(recommendation))
          .toList(),
    );
  }
}


class RecommendationMapper {
  static RecommendationEntity toEntity(RecommendationModel model) {
    return RecommendationEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      seasonId: model.seasonId,
      breedId: model.breedId,
      durationMonths: model.durationMonths,
      directionId: model.directionId,
      did: model.did,
    );
  }

  static RecommendationModel toModel(RecommendationEntity entity) {
    return RecommendationModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      seasonId: entity.seasonId,
      breedId: entity.breedId,
      durationMonths: entity.durationMonths,
      directionId: entity.directionId,
      did: entity.did,
    );
  }
}
