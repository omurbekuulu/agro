import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../presentation/service_locator.dart';
import '../models/pet.dart';

abstract class PetsService {
  Future<Either> getPets();
  Future<Either> postPets(PetModel pet);
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
      return Left(e.type.name);
    }
  }

  @override
  Future<Either> postPets(PetModel pet) async {
    try {
      final response = await sl<DioClient>().post(
        '${ApiUrl.pets}/save',
        data: pet.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }
}
