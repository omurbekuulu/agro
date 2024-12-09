import 'package:agro/core/usecase/usecase.dart';
import 'package:agro/domain/percent/repository/percent.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetPercentUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<PercentRepository>().getPercent(params);
  }
}
