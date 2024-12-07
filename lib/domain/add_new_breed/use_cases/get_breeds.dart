import 'package:agro/domain/add_new_breed/repositories/add_new_breed.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../presentation/service_locator.dart';

class GetBreedsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AddNewBreedRepository>().getBreeds();
  }
}
