part of 'statistics_cubit.dart';

@immutable
sealed class StatisticsState {}

final class InitialStatistics extends StatisticsState {}

final class LoadingStatistics extends StatisticsState {}

final class LoadedStatistics extends StatisticsState {
  LoadedStatistics({
    required this.directions,
    required this.breeds,
    required this.percent,
    required this.transactions,
  });

  final List<DirectionEntity> directions;
  final List<BreedEntity> breeds;
  final PercentEntity percent;
  final List<TransactionEntity> transactions;
}

final class FailureStatistics extends StatisticsState {
  FailureStatistics({required this.errorMessage});

  final String errorMessage;
}
