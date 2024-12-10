import 'package:dartz/dartz.dart';

abstract class RecommendationRepository {
  Future<Either> getRecommendations(int directionId, int breedId);
}
