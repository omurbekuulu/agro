import 'package:agro/domain/breeds/entities/breed.dart';
import 'package:agro/domain/directions/entity/direction.dart';
import 'package:agro/domain/transaction/entity/transaction.dart';
import 'package:agro/domain/transaction/usecase/get_transactions.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../../domain/directions/use_case/get_directoins.dart';
import '../../../../domain/percent/entity/percent.dart';
import '../../../../domain/percent/usecase/get_percent.dart';
import '../../../service_locator.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(InitialStatistics());

  void initStatistics({
    required int categoryId,
    required int directionId,
    required int petId,
    required int breedId,
  }) async {
    emit(LoadingStatistics());
    var responseDirections =
        await sl<GetDirectoinsUseCase>().call(params: categoryId);
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responsePercent = await sl<GetPercentUseCase>().call(params: petId);
    var responseTransactions = await sl<GetTransactionsUseCase>().call(
      startDate: '2024-12-14',
      endDate: '2024-12-14',
      breedId: breedId,
      directionId: directionId,
    );

    List<DirectionEntity> directions = [];
    List<BreedEntity> breeds = [];
    PercentEntity percent = PercentEntity(
      expense: 0,
      income: 0,
      performance: 0,
    );
    List<TransactionEntity> transactions = [];

    responseDirections.fold(
      (error) {
        emit(FailureStatistics(errorMessage: error));
      },
      (data) {
        directions = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(FailureStatistics(errorMessage: error));
      },
      (data) {
        breeds = data;
      },
    );

    responsePercent.fold(
      (error) {
        emit(FailureStatistics(errorMessage: error['message']));
      },
      (data) {
        percent = data;
      },
    );

    responseTransactions.fold(
      (error) {
        emit(FailureStatistics(errorMessage: error));
      },
      (data) {
        transactions = data;
      },
    );

    emit(
      LoadedStatistics(
        directions: directions,
        breeds: breeds,
        percent: percent,
        transactions: transactions,
      ),
    );
  }
}
