import 'package:agro/domain/season/repositories/season.dart';
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../presentation/service_locator.dart';

class GetSeasonsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SeasonRepository>().getSeasons();
  }
}
