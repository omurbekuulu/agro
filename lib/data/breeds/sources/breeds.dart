import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../presentation/service_locator.dart';

abstract class BreedsService {
  Future<Either> getBreeds();
}

class BreedsServiceImpl extends BreedsService {
  @override
  Future<Either> getBreeds() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.breeds,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }
}
