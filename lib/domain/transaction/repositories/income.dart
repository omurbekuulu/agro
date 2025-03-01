import 'package:agro/domain/transaction/entities/record.dart';
import 'package:dartz/dartz.dart';

abstract class IncomeRepository {
  Future<Either> postIncome(
    int userPetsId,
    bool isDecreas,
    RecordEntity entity,
  );
}