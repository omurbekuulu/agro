import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/pet/entities/pet.dart';
import '../../../../domain/pet/use_cases/get_pets.dart';
import '../../../../domain/transaction/entities/transaction.dart';
import '../../../../domain/transaction/usecases/get_transactions.dart';
import '../../../service_locator.dart';

part 'income_data_state.dart';

class IncomeDataCubit extends Cubit<IncomeDataState> {
  IncomeDataCubit()
      : super(IncomeDataState(
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
  void initIncomePage({
    required int userPetId,
    required int directionId,
  }) async {
    List<PetEntity> userPets = [];
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

    var userBreed = userPets.singleWhere((pet) => pet.id == userPetId);

    var startDate = state.selectedStartTimeRange;
    var endDate = state.selectedEndTimeRange;
    var responseTransactions = await sl<GetTransactionsUseCase>().call(
      startDate:
          '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}',
      endDate:
          '${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}',
      breedId: userBreed.id!,
      directionId: directionId,
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
        emit(state.copyWith(transactions: data));
      },
    );
  }

  void updateSelectedDate(DateTimeRange selectedDate) {
    emit(
      state.copyWith(selectedDateTimeRange: selectedDate),
    );
    print(
        '${selectedDate.start.year}-${selectedDate.start.month.toString().padLeft(2, '0')}-${selectedDate.start.day.toString().padLeft(2, '0')}');
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
    if (state.isEndRange || state.isStartRange) {
      emit(
        state.copyWith(
          selectedDateTimeRange: DateTimeRange(
            end: state.selectedEndTimeRange,
            start: state.selectedStartTimeRange,
          ),
        ),
      );
    }
  }
}
