import 'package:agro/core/network/dio_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/api_url.dart';
import '../../../presentation/service_locator.dart';

abstract class ProfitabilityService {
  Future<Either> getProfitability(int directionId);
}

class ProfitabilityServiceImpl extends ProfitabilityService {
  @override
  Future<Either> getProfitability(int directionId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.profitability}$directionId',
      );
      print(response);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }
}
