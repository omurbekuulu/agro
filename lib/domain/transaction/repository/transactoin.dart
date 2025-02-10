import 'package:dartz/dartz.dart';

import '../entity/expense.dart';

abstract class TransactoinRepository {
  Future<Either> getTransactions({
    required String startDate,
    required String endDate,
    required int breedId,
    required int directionId,
  });
  
  Future<Either> postExpense(
    int userPetsId,
    int recommId,
    ExpenseEntity entity,
  );
}
