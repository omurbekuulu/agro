import 'package:agro/domain/breeds/entities/breed.dart';
import 'package:agro/domain/directions/entity/direction.dart';
import 'package:agro/domain/directions/use_case/get_directoins.dart';
import 'package:agro/domain/percent/entity/percent.dart';
import 'package:agro/domain/percent/usecase/get_percent.dart';
import 'package:agro/domain/pet/entities/pet.dart';
import 'package:agro/domain/pet/use_cases/get_pets.dart';
import 'package:agro/domain/transaction/entities/record.dart';
import 'package:agro/domain/transaction/usecases/post_expense.dart';
import 'package:agro/domain/profitability/usecase/get_profitability.dart';
import 'package:agro/domain/recommendation/entity/recommentation.dart';
import 'package:agro/domain/transaction/usecases/post_income.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../../domain/recommendation/usecase/get_recommendations.dart';
import '../../../service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void updateDirection(DirectionEntity selectedDirection) async {
    List<PetEntity> userPets = [];
    List<BreedEntity> userBreeds = [];
    late int profitability;
    late PercentEntity percent;
    late List<CardEntity> cards;

    var responseUserPets = await sl<GetPetsUseCase>().call();
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responseProfibility =
        await sl<GetProfitabilityUseCase>().call(selectedDirection.id!);

    responseUserPets.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        userPets = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        List<BreedEntity> breeds = data;
        List<BreedEntity> userBreedsSorted = breeds.where((breed) {
          return userPets.any((pet) =>
              pet.directionId == selectedDirection.id &&
              pet.breedId == breed.id);
        }).toList();
        userBreeds = userBreedsSorted;
      },
    );

    responseProfibility.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        profitability = data;
      },
    );

    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: selectedDirection.id,
      params2: userBreeds.first.id,
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        cards = data;
      },
    );

    final selectedUserPet = userPets.firstWhere(
      (pet) =>
          pet.breedId == userBreeds.first.id &&
          pet.directionId == selectedDirection.id,
    );

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: selectedUserPet.id);

    responsePercent.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error['message']));
      },
      (data) {
        percent = data;
      },
    );

    emit(
      state.copyWith(
        userBreeds: userBreeds,
        profitability: profitability,
        percent: percent,
        cards: cards,
        selectedDirectionId: selectedDirection.id,
        selectedPetsId: selectedUserPet.id,
      ),
    );
  }

  void updateBreed(BreedEntity selectedBreed) async {
    late List<CardEntity> cards;

    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: state.selectedDirectionId,
      params2: selectedBreed.id,
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        cards = data;
      },
    );

    List<PetEntity> userPets = [];
    var responseUserPets = await sl<GetPetsUseCase>().call();
    responseUserPets.fold(
      (error) {
        emit(
          FailureLoadHome(errorMessage: error),
        );
      },
      (data) {
        userPets = data;
      },
    );
    var userPet = userPets.firstWhere(
      (pet) =>
          pet.breedId == selectedBreed.id &&
          pet.directionId == state.selectedDirectionId,
    );

    late PercentEntity percent;

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: userPet.id);

    responsePercent.fold(
      (error) {
        emit(
          FailureLoadHome(errorMessage: error),
        );
      },
      (data) {
        percent = data;
      },
    );

    emit(
      state.copyWith(
        percent: percent,
        cards: cards,
        selectedPetsId: userPet.id,
      ),
    );
  }

  void initHome() async {
    List<DirectionEntity> directions = [];
    List<BreedEntity> userBreeds = [];
    List<PetEntity> userPets = [];
    int profitability = 0;
    PercentEntity percent =
        PercentEntity(expense: 0, income: 0, performance: 0);
    List<CardEntity> cards = [];

    var responseDirections = await sl<GetDirectoinsUseCase>().call(params: 1);
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responseUserPets = await sl<GetPetsUseCase>().call();
    var responseProfibility =
        await sl<GetProfitabilityUseCase>().call(state.selectedDirectionId);

    responseDirections.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
        return;
      },
      (data) {
        directions = data;
      },
    );

    responseProfibility.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        profitability = data;
      },
    );

    responseUserPets.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        userPets = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        List<BreedEntity> breeds = data;
        List<BreedEntity> userBreedsSorted = breeds.where((breed) {
          return userPets.any((pet) =>
              pet.directionId == state.selectedDirectionId &&
              pet.breedId == breed.id);
        }).toList();
        userBreeds = userBreedsSorted;
      },
    );

    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: state.selectedDirectionId,
      params2: state.selectedBreedId ?? userBreeds.first.id,
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        cards = data;
      },
    );

    final selectedUserPet = userPets.firstWhere(
      (pet) =>
          pet.breedId == userBreeds.first.id &&
          pet.directionId == state.selectedDirectionId,
    );

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: selectedUserPet.id);

    responsePercent.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error['message']));
      },
      (data) {
        percent = data;
      },
    );

    emit(
      state.copyWith(
        isLoaded: true,
        directions: directions,
        userBreeds: userBreeds,
        profitability: profitability,
        percent: percent,
        cards: cards,
        selectedDirectionId: 1,
        selectedPetsId: selectedUserPet.id,
      ),
    );
  }

  void addExpense({
    required int selectedPetId,
    required int recommId,
    required RecordEntity recordEntity,
  }) async {
    await sl<PostExpenseUseCase>().postExpense(
      selectedPetId,
      recommId,
      recordEntity,
    );

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: selectedPetId);
    responsePercent.fold(
      (error) {
        emit(
          FailureLoadHome(errorMessage: error),
        );
      },
      (data) {
        emit(state.copyWith(percent: data));
      },
    );
  }

  void addIncome({
    required int selectedPetId,
    required bool isDecreas,
    required RecordEntity recordEntity,
  }) async {
    final responsePostIncome = await sl<PostIncomeUseCase>().postIncome(
      selectedPetId,
      isDecreas,
      recordEntity,
    );

    responsePostIncome.fold(
      (e) {
        emit(
          FailureLoadHome(errorMessage: e),
        );
      },
      (data) {
        if (isDecreas && data == "") {
          emit(
            state.copyWith(isConflict: false),
          );
        }
        if (isDecreas && data != "") {
          emit(
            state.copyWith(
              isConflict: true,
            ),
          );
        }
      },
    );

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: selectedPetId);
    responsePercent.fold(
      (error) {
        emit(
          FailureLoadHome(errorMessage: error),
        );
      },
      (data) {
        emit(state.copyWith(percent: data));
      },
    );
  }
}
