import 'package:agro/domain/pet/repositories/pets.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../presentation/service_locator.dart';

class GetPetsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<PetsRepository>().getPets();
  }
}
