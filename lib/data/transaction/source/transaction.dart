import 'package:agro/core/constants/api_url.dart';
import 'package:agro/core/network/dio_client.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class TransactionService {
  Future<Either> getTransactions(
    String startDate,
    String endDate,
    int breedId,
    int directionId,
    String profit,
  );
}

class TransactionServiceImpl extends TransactionService {
  @override
  Future<Either> getTransactions(
    String startDate,
    String endDate,
    int breedId,
    int directionId,
    String profit,
  ) async {
    try {
      final transactions = await sl<DioClient>().get(
        '${ApiUrl.transactions}/$directionId?sectionId=$breedId&startDate=$startDate&endDate=$endDate&profit=$profit',
      );
      return Right(transactions.data);
    } on DioException catch (e) {
      return Left(e.type.name);
    }
  }
}
