import 'package:agro/domain/pet/entities/pet.dart';
import 'package:agro/domain/pet/repositories/pets.dart';
import 'package:agro/presentation/service_locator.dart';

class PostPetsUsecase {
  Future<void> call(PetEntity pet) async {
    return await sl<PetsRepository>().postPets(pet);
  }
}
