import 'package:agro/domain/breeds/entities/breed.dart';
import 'package:agro/domain/directions/entity/direction.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../../domain/directions/use_case/get_directoins.dart';
import '../../../../domain/percent/entity/percent.dart';
import '../../../../domain/percent/usecase/get_percent.dart';
import '../../../../domain/pet/entities/pet.dart';
import '../../../../domain/pet/use_cases/get_pets.dart';
import '../../../../domain/transaction/entities/record.dart';
import '../../../../domain/transaction/usecases/post_expense.dart';
import '../../../../domain/transaction/usecases/post_income.dart';
import '../../../service_locator.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(const StatisticsState());

  void updateDirection(DirectionEntity selectedDirection) async {
    List<PetEntity> userPets = [];
    List<BreedEntity> userBreeds = [];
    late PercentEntity percent;

    var responseUserPets = await sl<GetPetsUseCase>().call();
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    responseUserPets.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error));
      },
      (data) {
        userPets = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error));
      },
      (data) {
        List<BreedEntity> userBreedsSorted = data.where((breed) {
          return userPets.any((pet) =>
              pet.directionId == selectedDirection.id &&
              pet.breedId == breed.id);
        }).toList();
        userBreeds = userBreedsSorted;
      },
    );

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: userBreeds.first.id);

    responsePercent.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error['message']));
      },
      (data) {
        percent = data;
      },
    );

    emit(
      state.copyWith(
        userBreeds: userBreeds,
        percent: percent,
      ),
    );
  }

  void updateBreed(BreedEntity selectedBreed) async {
    late PercentEntity percent;

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: selectedBreed.id);

    responsePercent.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error['message']));
      },
      (data) {
        percent = data;
      },
    );

    emit(
      state.copyWith(
        percent: percent,
      ),
    );
  }

  void initStatistics() async {
    List<DirectionEntity> directions = [];
    List<BreedEntity> userBreeds = [];
    List<PetEntity> userPets = [];
    PercentEntity percent =
        PercentEntity(expense: 0, income: 0, performance: 0);

    var responseDirections = await sl<GetDirectoinsUseCase>().call(params: 1);
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responseUserPets = await sl<GetPetsUseCase>().call();

    responseDirections.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error));
        return;
      },
      (data) {
        directions = data;
      },
    );

    responseUserPets.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error));
      },
      (data) {
        userPets = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error));
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

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: userBreeds.first.id);

    responsePercent.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error['message']));
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
        percent: percent,
        selectedDirectionId: 1,
        selectedPetsId: userBreeds.first.id,
      ),
    );
  }

  void addExpense({
    required int selectedPetId,
    required int recommId,
    required RecordEntity recordEntity,
  }) async {
    final responsePostExpense = await sl<PostExpenseUseCase>().postExpense(
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
    final responsePostIncome = await sl<PostIncomeUseCase>().postIncome(
      selectedPetId,
      isDecreas,
      recordEntity,
    );

    responsePostIncome.fold(
      (e) {
        emit(
          state.copyWith(
            isConflict: true,
          ),
        );
      },
      (data) {},
    );
  }
}
