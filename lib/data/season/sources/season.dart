import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../presentation/service_locator.dart';


abstract class SeasonService {
  Future<Either> getSeasons();
}

class SeasonServiceImpl extends SeasonService {
  @override
  Future<Either> getSeasons() async {
    try {
      var resoponse = await sl<DioClient>().get(
        ApiUrl.seasons,
      );
      return Right(resoponse.data);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }
}
