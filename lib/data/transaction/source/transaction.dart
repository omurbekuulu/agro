import 'package:agro/core/constants/api_url.dart';
import 'package:agro/core/network/dio_client.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../model/expense.dart';

abstract class TransactionService {
  Future<Either> getTransactions(
    String startDate,
    String endDate,
    int breedId,
    int directionId,
  );

  Future<Either> postExpense(int userPetsId, int recommId, ExpenseModel model);
}

class TransactionServiceImpl extends TransactionService {
  @override
  Future<Either> getTransactions(
    String startDate,
    String endDate,
    int breedId,
    int directionId,
  ) async {
    try {
      final transactions = await sl<DioClient>().get(
        '${ApiUrl.transactions}?startDate=$startDate&endDate=$endDate&breedId=$breedId&directionId=$directionId',
      );
      return Right(transactions.data);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }

  @override
  Future<Either> postExpense(
      int userPetsId, int recommId, ExpenseModel model) async {
    try {
      var response = await sl<DioClient>().post(
        '${ApiUrl.postExpense}/$userPetsId/$recommId',
        data: model.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }
}
