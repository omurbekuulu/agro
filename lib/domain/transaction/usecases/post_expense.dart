import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../entities/record.dart';
import '../repositories/expense.dart';

class PostExpenseUseCase {
  Future<Either> postExpense(
    int userPetsId,
    int recommId,
    RecordEntity entity,
  ) async {
    return await sl<ExpenseRepository>()
        .postExpense(userPetsId, recommId, entity);
  }
}
