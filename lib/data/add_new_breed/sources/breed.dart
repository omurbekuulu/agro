import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../presentation/service_locator.dart';

abstract class AddNewBreedService {
  Future<Either> getBreeds();
  Future<Either> getSeasons();
}

class AddNewBreedServiceImpl extends AddNewBreedService {
  @override
  Future<Either> getBreeds() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.breeds,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSeasons() async {
    try {
      var resoponse = await sl<DioClient>().get(
        ApiUrl.seasons,
      );
      return Right(resoponse.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
