part of 'statistics_cubit.dart';

@immutable
sealed class StatisticsState {}

class InitialStatistics extends StatisticsState {}

class LoadingStatistics extends StatisticsState {}

class LoadedStatistics extends StatisticsState {
  final List<DirectionEntity> directions;
  final int profitability;
  final List<BreedEntity> userBreeds;
  final PercentEntity? percent;
  final List<CardEntity> cards;
  final int selectedDirectionId;
  final int selectedBreedId;
  final int selectedPetsId;

  LoadedStatistics({
    this.selectedBreedId = 1,
    this.selectedDirectionId = 1,
    this.selectedPetsId = 1,
    this.profitability = 0,
    this.userBreeds = const [],
    this.directions = const [],
    this.percent,
    this.cards = const [],
  });

  LoadedStatistics copyWith({
    List<DirectionEntity>? directions,
    int? profitability,
    List<BreedEntity>? userBreeds,
    PercentEntity? percent,
    List<CardEntity>? cards,
    int? selectedDirectionId,
    int? selectedBreedId,
    int? selectedPetsId,
  }) {
    return LoadedStatistics(
      directions: directions ?? this.directions,
      profitability: profitability ?? this.profitability,
      userBreeds: userBreeds ?? this.userBreeds,
      percent: percent ?? this.percent,
      cards: cards ?? this.cards,
      selectedDirectionId: selectedDirectionId ?? this.selectedDirectionId,
      selectedBreedId: selectedBreedId ?? this.selectedBreedId,
      selectedPetsId: selectedPetsId ?? this.selectedPetsId,
    );
  }
}

class FailureLoadStatistics extends StatisticsState {
  final String errorMessage;

  FailureLoadStatistics({required this.errorMessage});
}
