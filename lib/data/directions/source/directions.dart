import 'package:agro/core/constants/api_url.dart';
import 'package:agro/core/network/dio_client.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class DirectionsService {
  Future<Either> getDirections(int categoryId);
}

class DirectionsServiceIpml extends DirectionsService {
  @override
  Future<Either> getDirections(int categoryId) async {
    try {
      var directions =
          await sl<DioClient>().get('${ApiUrl.directions}$categoryId');
      return Right(directions.data);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }
}
