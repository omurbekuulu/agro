import 'package:agro/domain/profitability/repository/profitability.dart';
import 'package:dartz/dartz.dart';

import '../../../presentation/service_locator.dart';

class GetProfitabilityUseCase {
  Future<Either> call(int directionId) async {
    return await sl<ProfitabilityRepository>().getProfitability(directionId);
  }
}
