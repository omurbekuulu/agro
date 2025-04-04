import 'package:agro/common/helper/mapper/breed_mapper.dart';
import 'package:agro/data/breeds/models/breed.dart';
import 'package:agro/data/breeds/sources/breeds.dart';
import 'package:agro/domain/breeds/repositories/breeds.dart';
import 'package:dartz/dartz.dart';
import '../../../presentation/service_locator.dart';

class BreedsRepositoryImpl implements BreedsRepository {
  @override
  Future<Either> getBreeds() async {
    var responseData = await sl<BreedsService>().getBreeds();

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
}
