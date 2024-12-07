
import 'package:agro/common/helper/mapper/season_mapper.dart';
import 'package:agro/data/season/sources/season.dart';
import 'package:agro/domain/season/repositories/season.dart';
import 'package:dartz/dartz.dart';
import '../../../presentation/service_locator.dart';
import '../models/season.dart';

class SeasonRepositoryImpl implements SeasonRepository {
  @override
  Future<Either> getSeasons() async {
    var responseData = await sl<SeasonService>().getSeasons();

    return responseData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var seasons = List.from(data)
            .map((item) => SeasonMapper.toEntity(SeasonModel.fromJson(item)))
            .toList();
        return Right(seasons);
      },
    );
  }
}
