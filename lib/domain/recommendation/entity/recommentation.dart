class CardEntity {
  final int id;
  final String name;
  final String description;
  final List<RecommendationEntity> recommendations;

  CardEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.recommendations,
  });
}

class RecommendationEntity {
  final int id;
  final String name;
  final String description;
  final int seasonId;
  final int breedId;
  final int durationMonths;
  final int directionId;
  final bool did;

  RecommendationEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.seasonId,
    required this.breedId,
    required this.durationMonths,
    required this.directionId,
    required this.did,
  });
}

