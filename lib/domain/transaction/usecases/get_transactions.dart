import 'package:agro/domain/transaction/repositories/transactoin.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetTransactionsUseCase {
  Future<Either> call({
    required String startDate,
    required String endDate,
    required int breedId,
    required int directionId,
  }) async {
    return await sl<TransactoinRepository>().getTransactions(
      startDate: startDate,
      endDate: endDate,
      breedId: breedId,
      directionId: directionId,
    );
  }
}
