import 'package:agro/domain/pet/entities/pet.dart';
import 'package:agro/domain/pet/use_cases/post_pets.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/entities/breed.dart';
import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../service_locator.dart';

part 'add_new_pet_state.dart';

class AddNewPetCubit extends Cubit<AddNewPetState> {
  AddNewPetCubit() : super(LoadingAddNewPet());

  void initBreeds() async {
    var responseBreeds = await sl<GetBreedsUseCase>().call();

    responseBreeds.fold(
      (error) {
        emit(
          FailureLoadAddNewPet(errorMessage: error),
        );
      },
      (data) {
        emit(
          LoadedAddNewPet().copyWith(breeds: data),
        );
      },
    );
  }

  void postPets(PetEntity pet) async {
    var requestPets = await sl<PostPetsUsecase>().call(pet);
  }

  void selectedPets(BreedEntity breed, int month, quantity) {
    emit(LoadedAddNewPet().copyWith(
      selectedBreed: breed,
      selectedMonth: month,
      selectedQuantity: quantity,
    ));
  }
}
