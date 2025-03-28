import 'package:agro/domain/breeds/entities/breed.dart';
import 'package:agro/domain/directions/entity/direction.dart';
import 'package:agro/domain/transaction/entities/transaction.dart';
import 'package:agro/domain/transaction/usecases/get_transactions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  StatisticsCubit()
      : super(StatisticsState(
          selectedDateTimeRange: DateTimeRange(
            start: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day - 1,
              23,
              59,
              59,
            ),
            end: DateTime.now(),
          ),
          selectedStartTimeRange: DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day - 1,
            23,
            59,
            59,
          ),
          selectedEndTimeRange: DateTime.now(),
          focusedDay: DateTime.now(),
        ));

  void updateDirection(DirectionEntity selectedDirection) async {
    List<PetEntity> userPets = [];
    List<BreedEntity> userBreeds = [];

    var responseUserPets = await sl<GetPetsUseCase>().call();
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    responseUserPets.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
      },
      (data) {
        userPets = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
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

    final selectedUserPet = userPets.singleWhere(
      (pet) =>
          pet.breedId == userBreeds.first.id &&
          pet.directionId == selectedDirection.id,
    );

    emit(
      state.copyWith(
        selectedDirectionId: selectedDirection.id,
        userBreeds: userBreeds,
        selectedPetsId: selectedUserPet.id,
      ),
    );

    updateBreed(
      selectedBreedId: userBreeds.first.id,
      selectedDirectionId: selectedDirection.id!,
    );
  }

  void updateBreed({
    required int selectedBreedId,
    required int selectedDirectionId,
  }) async {
    List<PetEntity> userPets = [];
    var income = 0;
    var expense = 0;
    List<TransactionEntity> transactions = [];

    var responseUserPets = await sl<GetPetsUseCase>().call();
    responseUserPets.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
      },
      (data) {
        userPets = data;
      },
    );
    var userPet = userPets.firstWhere(
      (pet) =>
          pet.breedId == selectedBreedId &&
          pet.directionId == selectedDirectionId,
    );

    var startDate = state.selectedDateTimeRange.start;
    var endDate = state.selectedDateTimeRange.end;
    var responseTransactions = await sl<GetTransactionsUseCase>().call(
      startDate:
          '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}',
      endDate:
          '${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}',
      breedId: selectedBreedId,
      directionId: selectedDirectionId,
      profit: 'INCOME',
    );

    responseTransactions.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
      },
      (data) {
        transactions = data;
        income = data.fold(0, (sum, transaction) => sum + transaction.price);
      },
    );

    var responseTransactionsExpenses = await sl<GetTransactionsUseCase>().call(
      startDate:
          '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}',
      endDate:
          '${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}',
      breedId: selectedBreedId,
      directionId: selectedDirectionId,
      profit: 'EXPENSES',
    );

    responseTransactionsExpenses.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
      },
      (data) {
        transactions += data;
        expense = data.fold(0, (sum, transaction) => sum + transaction.price);
      },
    );

    emit(
      state.copyWith(
        selectedPetsId: userPet.id,
        selectedBreedId: selectedBreedId,
        percent: PercentEntity(expense: expense, income: income),
        transactions: transactions,
      ),
    );
  }

  void initStatistics() async {
    List<DirectionEntity> directions = [];
    List<BreedEntity> userBreeds = [];
    List<PetEntity> userPets = [];
    int petQuantity = 0;
    var income = 0;
    var expense = 0;
    List<TransactionEntity> transactions = [];

    var responseDirections = await sl<GetDirectoinsUseCase>().call(params: 1);
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responseUserPets = await sl<GetPetsUseCase>().call();

    responseDirections.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
        return;
      },
      (data) {
        directions = data;
      },
    );

    responseUserPets.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
      },
      (data) {
        userPets = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
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

    final selectedUserPet = userPets.firstWhere(
      (pet) =>
          pet.breedId == userBreeds.first.id &&
          pet.directionId == state.selectedDirectionId,
    );

    var startDate = state.selectedStartTimeRange;
    var endDate = state.selectedEndTimeRange;
    var responseTransactionsIncomes = await sl<GetTransactionsUseCase>().call(
      startDate:
          '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}',
      endDate:
          '${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}',
      breedId: userBreeds.first.id,
      directionId: state.selectedDirectionId,
      profit: 'INCOME',
    );

    responseTransactionsIncomes.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
      },
      (data) {
        transactions = data;
        income = data.fold(0, (sum, transaction) => sum + transaction.price);
      },
    );

    var responseTransactionsExpenses = await sl<GetTransactionsUseCase>().call(
      startDate:
          '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}',
      endDate:
          '${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}',
      breedId: userBreeds.first.id,
      directionId: state.selectedDirectionId,
      profit: 'EXPENSES',
    );

    responseTransactionsExpenses.fold(
      (error) {
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
      },
      (data) {
        transactions += data;
        expense = data.fold(0, (sum, transaction) => sum + transaction.price);
      },
    );

    petQuantity =
        transactions.fold(0, (sum, transaction) => sum + transaction.quantity);

    emit(
      state.copyWith(
        isLoaded: true,
        directions: directions,
        userBreeds: userBreeds,
        userPets: userPets,
        petQuantity: petQuantity,
        percent: PercentEntity(expense: expense, income: income),
        selectedDirectionId: 1,
        selectedPetsId: selectedUserPet.id,
        selectedBreedId: userBreeds.first.id,
        transactions: transactions,
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
        emit(state.copyWith(
          isFailure: true,
          failureMessage: error,
        ));
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
          state.copyWith(
            isFailure: true,
            failureMessage: e,
          ),
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
    updateBreed(
      selectedBreedId: state.selectedBreedId!,
      selectedDirectionId: state.selectedDirectionId,
    );
  }

  void updateSelectedDate(DateTimeRange selectedDate) {
    emit(
      state.copyWith(selectedDateTimeRange: selectedDate),
    );
  }

  void onSelectDate(DateTime day) {
    emit(
      state.copyWith(
        focusedDay: day,
      ),
    );
    if (state.isStartRange) {
      emit(
        state.copyWith(
          selectedStartTimeRange: day,
          selectedDateTimeRange: DateTimeRange(
            start: day,
            end: state.selectedEndTimeRange,
          ),
        ),
      );
    }
    if (state.isEndRange) {
      emit(
        state.copyWith(
          selectedEndTimeRange: day,
          selectedDateTimeRange: DateTimeRange(
            start: state.selectedStartTimeRange,
            end: day,
          ),
        ),
      );
    }
  }

  void switchRange({required bool isStartRange, required bool isEndRange}) {
    emit(
      state.copyWith(
        isStartRange: isStartRange,
        isEndRange: isEndRange,
      ),
    );
  }

  void onFilter() {
    updateBreed(
      selectedBreedId: state.selectedBreedId!,
      selectedDirectionId: state.selectedDirectionId,
    );
  }
}
