import 'package:agro/core/constants/api_url.dart';
import 'package:agro/core/network/dio_client.dart';
import 'package:agro/data/transaction/models/record.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ExpenseService {
  Future<Either> postExpense(int userPetsId, int recommId, RecordModel model);
}

class ExpenseServiceImpl extends ExpenseService {
  @override
  Future<Either> postExpense(
      int userPetsId, int recommId, RecordModel model) async {
    try {
      var response = await sl<DioClient>().post(
        '${ApiUrl.postExpense}$userPetsId?recommendationId=$recommId',
        data: model.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }
}
