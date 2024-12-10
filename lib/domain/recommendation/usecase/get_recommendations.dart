import 'package:agro/core/usecase/usecase.dart';
import 'package:agro/domain/recommendation/repository/recommendation.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetRecommendationsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params, params2}) async {
    return await sl<RecommendationRepository>()
        .getRecommendations(params, params2);
  }
}
