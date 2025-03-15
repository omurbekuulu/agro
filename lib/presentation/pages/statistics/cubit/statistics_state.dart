part of 'statistics_cubit.dart';

@immutable
class StatisticsState extends Equatable {
  final bool isLoaded;
  final List<DirectionEntity> directions;
  final List<BreedEntity> userBreeds;
  final PercentEntity? percent;
  final int selectedDirectionId;
  final int? selectedBreedId;
  final int? selectedPetsId;
  final bool isConflict;

  const StatisticsState({
    this.isLoaded = false,
    this.directions = const [],
    this.userBreeds = const [],
    this.percent,
    this.selectedDirectionId = 1,
    this.selectedBreedId,
    this.selectedPetsId,
    this.isConflict = false,
  });

  StatisticsState copyWith({
    bool? isLoaded,
    List<DirectionEntity>? directions,
    List<BreedEntity>? userBreeds,
    PercentEntity? percent,
    int? selectedDirectionId,
    int? selectedBreedId,
    int? selectedPetsId,
    bool? isConflict,
  }) {
    return StatisticsState(
      isLoaded: isLoaded ?? this.isLoaded,
      directions: directions ?? this.directions,
      userBreeds: userBreeds ?? this.userBreeds,
      percent: percent ?? this.percent,
      selectedDirectionId: selectedDirectionId ?? this.selectedDirectionId,
      selectedBreedId: selectedBreedId ?? this.selectedBreedId,
      selectedPetsId: selectedPetsId ?? this.selectedPetsId,
      isConflict: isConflict ?? this.isConflict,
    );
  }

  @override
  List<Object?> get props {
    return [
      isLoaded,
      directions,
      userBreeds,
      percent,
      selectedDirectionId,
      selectedBreedId,
      selectedPetsId,
      isConflict,
    ];
  }
}

class FailureLoadStatistics extends StatisticsState {
  final String errorMessage;

  const FailureLoadStatistics({required this.errorMessage});
}
