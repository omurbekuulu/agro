import 'package:agro/domain/transaction/entities/record.dart';
import 'package:dartz/dartz.dart';

abstract class ExpenseRepository {
  Future<Either> postExpense(
    int userPetsId,
    int recommId,
    RecordEntity entity,
  );
}
