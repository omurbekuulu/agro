class CardModel {
  final int id;
  final String name;
  final String description;
  final List<RecommendationModel> recommendations;

  CardModel({
    required this.id,
    required this.name,
    required this.description,
    required this.recommendations,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    var recommendationsJson = json['recommendations'] as List;
    List<RecommendationModel> recommendationsList =
        recommendationsJson.map((e) => RecommendationModel.fromJson(e)).toList();

    return CardModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      recommendations: recommendationsList,
    );
  }
}

class RecommendationModel {
  final int id;
  final String name;
  final String description;
  final int seasonId;
  final int breedId;
  final int durationMonths;
  final int directionId;
  final bool did;

  RecommendationModel({
    required this.id,
    required this.name,
    required this.description,
    required this.seasonId,
    required this.breedId,
    required this.durationMonths,
    required this.directionId,
    required this.did,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      seasonId: json['seasonId'],
      breedId: json['sectionsId'],
      durationMonths: json['durationMonths'],
      directionId: json['directionId'],
      did: json['did'],
    );
  }
}

