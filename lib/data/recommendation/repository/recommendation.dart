import 'package:agro/common/helper/mapper/recommedation.dart';
import 'package:agro/data/recommendation/model/recommentation.dart';
import 'package:agro/data/recommendation/source/recommendation.dart';
import 'package:agro/domain/recommendation/repository/recommendation.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class RecommendationRepositoryImpl extends RecommendationRepository {
  @override
  Future<Either> getRecommendations(int directionId, int breedId) async {
    final responseRecommendations = await sl<RecommendationService>()
        .getRecommendations(directionId, breedId);

    return responseRecommendations.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final recommendations = List.from(data)
            .map((item) => CardMapper.toEntity(
                CardModel.fromJson(item)))
            .toList();

        return Right(recommendations);
      },
    );
  }
}
