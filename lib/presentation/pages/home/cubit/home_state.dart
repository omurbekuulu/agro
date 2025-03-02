part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  final bool isLoaded;
  final List<DirectionEntity> directions;
  final List<BreedEntity> userBreeds;
  final int profitability;
  final PercentEntity? percent;
  final List<CardEntity> cards;
  final int selectedDirectionId;
  final int? selectedBreedId;
  final int? selectedPetsId;

  const HomeState({
    this.isLoaded = false,
    this.directions = const [],
    this.userBreeds = const [],
    this.profitability = 0,
    this.percent,
    this.cards = const [],
    this.selectedDirectionId = 1,
    this.selectedBreedId,
    this.selectedPetsId,
  });

  HomeState copyWith({
    bool? isLoaded,
    List<DirectionEntity>? directions,
    List<BreedEntity>? userBreeds,
    int? profitability,
    PercentEntity? percent,
    List<CardEntity>? cards,
    int? selectedDirectionId,
    int? selectedBreedId,
    int? selectedPetsId,
  }) {
    return HomeState(
      isLoaded: isLoaded ?? this.isLoaded,
      directions: directions ?? this.directions,
      userBreeds: userBreeds ?? this.userBreeds,
      profitability: profitability ?? this.profitability,
      percent: percent ?? this.percent,
      cards: cards ?? this.cards,
      selectedDirectionId: selectedDirectionId ?? this.selectedDirectionId,
      selectedBreedId: selectedBreedId ?? this.selectedBreedId,
      selectedPetsId: selectedPetsId ?? this.selectedPetsId,
    );
  }

  @override
  List<Object> get props {
    return [
      isLoaded,
      directions,
      userBreeds,
      profitability,
      percent!,
      cards,
      selectedDirectionId,
      selectedBreedId!,
      selectedPetsId!,
    ];
  }
}

class FailureLoadHome extends HomeState {
  final String errorMessage;

  const FailureLoadHome({required this.errorMessage});
}
