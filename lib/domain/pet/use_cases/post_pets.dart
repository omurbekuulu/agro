import 'package:agro/domain/pet/entities/pet.dart';
import 'package:agro/domain/pet/repositories/pets.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class PostPetsUsecase {
  Future<Either> call(PetEntity pet) async {
    return await sl<PetsRepository>().postPets(pet);
  }
}
