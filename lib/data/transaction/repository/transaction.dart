import 'package:agro/common/helper/mapper/transaction.dart';
import 'package:agro/data/transaction/model/transaction.dart';
import 'package:agro/data/transaction/source/transaction.dart';
import 'package:agro/domain/transaction/repository/transactoin.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../../common/helper/mapper/expense_mapper.dart';
import '../../../domain/transaction/entity/expense.dart';

class TransactionRepositoryImpl extends TransactoinRepository {
  @override
  Future<Either> getTransactions({
    required String startDate,
    required String endDate,
    required int breedId,
    required int directionId,
  }) async {
    final responseTransactions = await sl<TransactionService>().getTransactions(
      startDate,
      endDate,
      breedId,
      directionId,
    );

    return responseTransactions.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final transactions = List.from(data)
            .map((transaction) => TransactionMapper.toEntity(
                TransactionModel.fromJson(transaction)))
            .toList();
        return Right(transactions);
      },
    );
  }

  @override
  Future<Either> postExpense(
    int userPetsId,
    int recommId,
    ExpenseEntity entity,
  ) async {
    final toModel = ExpenseMapper.toModel(entity);

    final response = await sl<TransactionService>().postExpense(
      userPetsId,
      recommId,
      toModel,
    );

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
