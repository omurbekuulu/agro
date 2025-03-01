import 'package:agro/common/helper/mapper/transaction.dart';
import 'package:agro/data/transaction/models/transaction.dart';
import 'package:agro/data/transaction/source/transaction.dart';
import 'package:agro/domain/transaction/repositories/transactoin.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

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
}
