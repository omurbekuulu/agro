part of 'add_new_pet_cubit.dart';

class AddNewPetState {
  bool isLoading;
  List<BreedEntity> breeds;
  BreedEntity? selectedBreed;
  int? selectedMonth;
  int? selectedQuantity;

  AddNewPetState({
    this.isLoading = false,
    this.breeds = const [],
    this.selectedBreed,
    this.selectedMonth,
    this.selectedQuantity,
  });

  AddNewPetState copyWith({
    bool? isLoading,
    List<BreedEntity>? breeds,
    BreedEntity? selectedBreed,
    int? selectedMonth,
    int? selectedQuantity,
  }) {
    return AddNewPetState(
      isLoading: isLoading ?? this.isLoading,
      breeds: breeds ?? this.breeds,
      selectedBreed: selectedBreed ?? this.selectedBreed,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      selectedQuantity: selectedQuantity ?? this.selectedQuantity,
    );
  }
}
