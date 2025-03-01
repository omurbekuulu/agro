import 'package:agro/domain/transaction/repositories/income.dart';
import 'package:dartz/dartz.dart';

import '../../../presentation/service_locator.dart';
import '../entities/record.dart';

class PostIncomeUseCase {
  Future<Either> postIncome(
    int userPetsId,
    bool isDecreas,
    RecordEntity recordEntity,
  ) async {
    return await sl<IncomeRepository>()
        .postIncome(userPetsId, isDecreas, recordEntity);
  }
}