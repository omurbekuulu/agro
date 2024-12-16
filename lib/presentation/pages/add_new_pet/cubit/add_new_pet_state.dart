part of 'add_new_pet_cubit.dart';

@immutable
sealed class AddNewPetState {}

class LoadingAddNewPet extends AddNewPetState {}

class LoadedAddNewPet extends AddNewPetState {
  final List<BreedEntity> breeds;
  final BreedEntity? selectedBreed;
  final int? selectedMonth;
  final int? selectedQuantity;

  LoadedAddNewPet({
    this.breeds = const [],
    this.selectedBreed,
    this.selectedMonth,
    this.selectedQuantity,
  });

  LoadedAddNewPet copyWith({
    List<BreedEntity>? breeds,
    BreedEntity? selectedBreed,
    int? selectedMonth,
    int? selectedQuantity,
  }) {
    return LoadedAddNewPet(
      breeds: breeds ?? this.breeds,
      selectedBreed: selectedBreed ?? this.selectedBreed,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      selectedQuantity: selectedQuantity ?? this.selectedQuantity,
    );
  }
}

class FailureLoadAddNewPet extends AddNewPetState {
  final String errorMessage;

  FailureLoadAddNewPet({required this.errorMessage});
}
