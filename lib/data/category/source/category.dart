import 'package:agro/core/constants/api_url.dart';
import 'package:agro/core/network/dio_client.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CategoryService {
  Future<Either> getAllCategory();
}

class CategoryServiceImpl extends CategoryService {
  @override
  Future<Either> getAllCategory() async {
    try {
      final response = await sl<DioClient>().get(ApiUrl.categories);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
