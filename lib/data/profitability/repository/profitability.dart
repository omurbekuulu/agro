import 'package:agro/data/profitability/source/profitability.dart';
import 'package:agro/domain/profitability/repository/profitability.dart';
import 'package:dartz/dartz.dart';

import '../../../presentation/service_locator.dart';

class ProfitabilityRepositoryImpl extends ProfitabilityRepository {
  @override
  Future<Either> getProfitability(int directionId) async {
    final responseData =
        await sl<ProfitabilityService>().getProfitability(directionId);

    return responseData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
