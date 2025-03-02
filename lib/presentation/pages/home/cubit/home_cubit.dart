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

  void updateDirection(DirectionEntity selectedDirection) {
    emit(
      (state).copyWith(selectedDirectionId: selectedDirection.id),
    );
  }

  void updateBreed(BreedEntity selectedBreed) {
    emit(
      (state).copyWith(selectedBreedId: selectedBreed.id),
    );
  }

  void initHome() async {
    emit(
      state.copyWith(isLoaded: false),
    );

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
        await sl<GetProfitabilityUseCase>().call(1);

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
        List<BreedEntity> userBreedsSorted = data.where((breed) {
          return userPets.any((pet) =>
              pet.directionId == state.selectedDirectionId &&
              pet.breedId == breed.id);
        }).toList();
        userBreeds = userBreedsSorted;
      },
    );

    var selectedPet = userPets.first;
    
    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: 1,
      params2: selectedPet.id,
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        cards = data;
      },
    );

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: selectedPet.id);

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
        selectedPetsId: selectedPet.id,
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
  }

  void addIncome({
    required int selectedPetId,
    required bool isDecreas,
    required RecordEntity recordEntity,
  }) async {
    await sl<PostIncomeUseCase>().postIncome(
      selectedPetId,
      isDecreas,
      recordEntity,
    );
  }
}
