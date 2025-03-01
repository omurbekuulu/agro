import 'package:agro/core/constants/api_url.dart';
import 'package:agro/core/network/dio_client.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class PercentService {
  Future<Either> getPercent(int petId);
}

class PercentServiceImpl extends PercentService {
  @override
  Future<Either> getPercent(int petId) async {
    try {
      final directions = await sl<DioClient>().get(
        '${ApiUrl.percent}$petId',
      );
      return Right(directions.data);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }
}
