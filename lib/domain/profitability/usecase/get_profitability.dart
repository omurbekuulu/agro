import 'package:agro/core/usecase/usecase.dart';
import 'package:agro/domain/profitability/repository/profitability.dart';
import 'package:dartz/dartz.dart';

import '../../../presentation/service_locator.dart';

class GetProfitabilityUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ProfitabilityRepository>().getProfitability(params!);
  }
}
