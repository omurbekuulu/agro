import 'package:agro/core/usecase/usecase.dart';
import 'package:agro/domain/directions/repository/directions.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetDirectoinsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<DirectionsRepository>().getDirections(params);
  }
}
