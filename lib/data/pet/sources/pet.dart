import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../presentation/service_locator.dart';
import '../models/pet.dart';

abstract class PetsService {
  Future<Either> getPets();
  Future<void> postPets(PetModel pet);
}

class PetsServiceImpl extends PetsService {
  @override
  Future<Either> getPets() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.pets,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  @override
  Future<void> postPets(PetModel pet) async {
    try {
      await sl<DioClient>().post(
        '${ApiUrl.pets}/save',
        data: pet.toJson(),
      );
    } on DioException catch (e) {
      throw e.response!.data;
    }
  }
}
