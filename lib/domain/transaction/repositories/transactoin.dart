import 'package:dartz/dartz.dart';

abstract class TransactoinRepository {
  Future<Either> getTransactions({
    required String startDate,
    required String endDate,
    required int breedId,
    required int directionId,
  });
}
