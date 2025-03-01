import 'package:agro/data/transaction/source/expense.dart';
import 'package:agro/domain/transaction/entities/record.dart';
import 'package:agro/domain/transaction/repositories/expense.dart';
import 'package:dartz/dartz.dart';

import '../../../common/helper/mapper/record_mapper.dart';
import '../../../presentation/service_locator.dart';

class ExpenseRepositoryImpl extends ExpenseRepository {
  @override
  Future<Either> postExpense(
    int userPetsId,
    int recommId,
    RecordEntity entity,
  ) async {
    final toModel = RecordMapper.toModel(entity);

    final response = await sl<ExpenseService>().postExpense(
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
