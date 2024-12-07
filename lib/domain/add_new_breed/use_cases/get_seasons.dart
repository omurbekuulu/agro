import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../presentation/service_locator.dart';
import '../repositories/add_new_breed.dart';

class GetSeasonsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AddNewBreedRepository>().getSeasons();
  }
}
