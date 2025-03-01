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
import 'package:meta/meta.dart';

import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../../domain/recommendation/usecase/get_recommendations.dart';
import '../../../service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHome());

  void updateDirection(DirectionEntity selectedDirection) {
    emit(
      (state as LoadedHome).copyWith(selectedDirectionId: selectedDirection.id),
    );
  }

  void updateBreed(BreedEntity selectedBreed) {
    emit(
      (state as LoadedHome).copyWith(selectedBreedId: selectedBreed.id),
    );
  }

  void initHome() async {
    emit(LoadingHome());

    List<DirectionEntity> directions = [];
    List<PetEntity> userPets = [];
    int profitability = 0;
    List<BreedEntity> userBreeds = [];
    List<CardEntity> cards = [];
    PercentEntity percent =
        PercentEntity(expense: 0, income: 0, performance: 0);

    var responseDirections = await sl<GetDirectoinsUseCase>().call(params: 1);
    var responseUserPets = await sl<GetPetsUseCase>().call();
    var responseProfibility = await sl<GetProfitabilityUseCase>()
        .call(LoadedHome().selectedDirectionId);
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: LoadedHome().selectedDirectionId,
      params2: LoadedHome().selectedBreedId,
    );

    responseDirections.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
        return;
      },
      (data) {
        directions = data;
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

    responseProfibility.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        profitability = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        List<BreedEntity> userBreedsSorted = data.where((breed) {
          return userPets.any((pet) =>
              pet.directionId == LoadedHome().selectedDirectionId &&
              pet.breedId == breed.id);
        }).toList();
        userBreeds = userBreedsSorted;
      },
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        cards = data;
      },
    );

    var selectedPet = userPets.first;

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
      LoadedHome().copyWith(
        directions: directions,
        userPets: userPets,
        selectedPetsId: selectedPet.id,
        profitability: profitability,
        userBreeds: userBreeds,
        cards: cards,
        percent: percent,
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
    print('$selectedPetId $isDecreas $recordEntity');
    await sl<PostIncomeUseCase>().postIncome(
      selectedPetId,
      isDecreas,
      recordEntity,
    );
  }
}
