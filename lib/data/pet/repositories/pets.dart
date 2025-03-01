import 'package:agro/common/helper/mapper/pet_mapper.dart';
import 'package:agro/data/pet/models/pet.dart';
import 'package:agro/data/pet/sources/pet.dart';
import 'package:agro/domain/pet/entities/pet.dart';
import 'package:agro/domain/pet/repositories/pets.dart';
import 'package:dartz/dartz.dart';
import '../../../presentation/service_locator.dart';

class PetsRepositoryImpl implements PetsRepository {
  @override
  Future<Either> getPets() async {
    var responseData = await sl<PetsService>().getPets();

    return responseData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var pets = List.from(data)
            .map((item) => PetMapper.toEntity(PetModel.fromJson(item)))
            .toList();
        return Right(pets);
      },
    );
  }

  @override
  Future<Either> postPets(PetEntity pet) async {
    final modelPet = PetMapper.toModel(pet);
    var responseData = await sl<PetsService>().postPets(modelPet);

    return responseData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
