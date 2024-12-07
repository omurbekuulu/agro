import 'package:agro/common/helper/mapper/breed_mapper.dart';
import 'package:agro/common/helper/mapper/season_mapper.dart';
import 'package:agro/data/add_new_breed/models/breed.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/add_new_breed/repositories/add_new_breed.dart';
import '../../../presentation/service_locator.dart';
import '../models/season.dart';
import '../sources/add_new_breed.dart';

class AddNewBreedBreedRepositoryImpl implements AddNewBreedRepository {
  @override
  Future<Either> getBreeds() async {
    var responseData = await sl<AddNewBreedService>().getBreeds();

    return responseData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var breeds = List.from(data)
            .map((item) => BreedMapper.toEntity(BreedModel.fromJson(item)))
            .toList();
        return Right(breeds);
      },
    );
  }

  @override
  Future<Either> getSeasons() async {
    var responseData = await sl<AddNewBreedService>().getSeasons();

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
