import 'package:agro/domain/breeds/repositories/breeds.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../presentation/service_locator.dart';

class GetBreedsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<BreedsRepository>().getBreeds();
  }
}
