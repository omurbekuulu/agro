

import 'package:dartz/dartz.dart';

import '../../../common/helper/mapper/record_mapper.dart';
import '../../../domain/transaction/entities/record.dart';
import '../../../domain/transaction/repositories/income.dart';
import '../../../presentation/service_locator.dart';
import '../source/income.dart';

class IncomeRepositoryImpl extends IncomeRepository {
  @override
  Future<Either> postIncome(
    int userPetsId,
    bool isDecreas,
    RecordEntity entity,
  ) async {
    final toModel = RecordMapper.toModel(entity);

    final response = await sl<IncomeService>().postIncome(
      userPetsId,
      isDecreas,
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
