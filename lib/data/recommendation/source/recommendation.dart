import 'package:agro/core/constants/api_url.dart';
import 'package:agro/core/network/dio_client.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class RecommendationService {
  Future<Either> getRecommendations(int directionId, int breedId);
}

class RecommendationServiceImpl extends RecommendationService {
  @override
  Future<Either> getRecommendations(int directionId, int breedId) async {
    try {
      final recommendations = await sl<DioClient>().get(
        '${ApiUrl.recommendations}$directionId/$breedId',
      );
      return Right(recommendations.data);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }
}
