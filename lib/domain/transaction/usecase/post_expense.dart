import 'package:agro/domain/transaction/entity/expense.dart';
import 'package:agro/domain/transaction/repository/transactoin.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class PostExpenseUseCase {
  Future<Either> post_expense(
    int userPetsId,
    int recommId,
    ExpenseEntity entity,
  ) async {
    return await sl<TransactoinRepository>()
        .postExpense(userPetsId, recommId, entity);
  }
}
