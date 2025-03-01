import 'package:agro/domain/pet/entities/pet.dart';
import 'package:agro/domain/pet/use_cases/post_pets.dart';
import 'package:bloc/bloc.dart';

import '../../../../domain/breeds/entities/breed.dart';
import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../service_locator.dart';

part 'add_new_pet_state.dart';

class AddNewPetCubit extends Cubit<AddNewPetState> {
  AddNewPetCubit() : super(AddNewPetState());

  void initBreeds() async {
    emit(
      state.copyWith(isLoading: true),
    );
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    responseBreeds.fold(
      (error) {},
      (data) {
        emit(
          state.copyWith(breeds: data, isLoading: false),
        );
      },
    );
  }

  void updateSelectedBreed(BreedEntity breed) {
    emit(
      state.copyWith(selectedBreed: breed),
    );
  }

  void updateSelectedMonth(int month) {
    emit(
      state.copyWith(selectedMonth: month),
    );
  }

  void updateSelectedQuantity(int quantity) {
    emit(
      state.copyWith(selectedQuantity: quantity),
    );
  }

  void postPets(int directionId) async {
    await sl<PostPetsUsecase>().call(
      PetEntity(
        breedId: state.selectedBreed!.id,
        directionId: directionId,
        quantity: state.selectedQuantity!,
        animalMonths: state.selectedMonth!,
      ),
    );
  }
}
