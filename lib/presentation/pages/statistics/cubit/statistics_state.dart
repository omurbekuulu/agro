part of 'statistics_cubit.dart';

@immutable
class StatisticsState extends Equatable {
  final bool isLoaded;
  final bool isFailure;
  final String failureMessage;
  final List<DirectionEntity> directions;
  final List<BreedEntity> userBreeds;
  final List<PetEntity> userPets;
  final int petQuantity;
  final PercentEntity? percent;
  final int selectedDirectionId;
  final int? selectedBreedId;
  final int? selectedPetsId;
  final bool isConflict;
  final DateTimeRange selectedDateTimeRange;
  final DateTime selectedStartTimeRange;
  final DateTime selectedEndTimeRange;
  final bool isStartRange;
  final bool isEndRange;
  final DateTime focusedDay;
  final List<TransactionEntity> transactions;

  const StatisticsState({
    this.isLoaded = false,
    this.isFailure = false,
    this.failureMessage = '',
    this.directions = const [],
    this.userBreeds = const [],
    this.userPets = const [],
    this.petQuantity = 0,
    this.percent,
    this.selectedDirectionId = 1,
    this.selectedBreedId,
    this.selectedPetsId,
    this.isConflict = false,
    required this.selectedDateTimeRange,
    required this.selectedStartTimeRange,
    required this.selectedEndTimeRange,
    this.isStartRange = false,
    this.isEndRange = false,
    required this.focusedDay,
    this.transactions = const [],
  });

  StatisticsState copyWith({
    bool? isLoaded,
    bool? isFailure,
    String? failureMessage,
    List<DirectionEntity>? directions,
    List<BreedEntity>? userBreeds,
    List<PetEntity>? userPets,
    PercentEntity? percent,
    int? selectedDirectionId,
    int? selectedBreedId,
    int? selectedPetsId,
    int? petQuantity,
    bool? isConflict,
    DateTimeRange? selectedDateTimeRange,
    DateTime? selectedStartTimeRange,
    DateTime? selectedEndTimeRange,
    bool? isStartRange,
    bool? isEndRange,
    DateTime? focusedDay,
    List<TransactionEntity>? transactions,
  }) {
    return StatisticsState(
      isLoaded: isLoaded ?? this.isLoaded,
      isFailure: isFailure ?? this.isFailure,
      failureMessage: failureMessage ?? this.failureMessage,
      directions: directions ?? this.directions,
      userBreeds: userBreeds ?? this.userBreeds,
      userPets: userPets ?? this.userPets,
      petQuantity: petQuantity ?? this.petQuantity,
      percent: percent ?? this.percent,
      selectedDirectionId: selectedDirectionId ?? this.selectedDirectionId,
      selectedBreedId: selectedBreedId ?? this.selectedBreedId,
      selectedPetsId: selectedPetsId ?? this.selectedPetsId,
      isConflict: isConflict ?? this.isConflict,
      selectedDateTimeRange:
          selectedDateTimeRange ?? this.selectedDateTimeRange,
      selectedStartTimeRange:
          selectedStartTimeRange ?? this.selectedStartTimeRange,
      selectedEndTimeRange: selectedEndTimeRange ?? this.selectedEndTimeRange,
      isStartRange: isStartRange ?? this.isStartRange,
      isEndRange: isEndRange ?? this.isEndRange,
      focusedDay: focusedDay ?? this.focusedDay,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object?> get props {
    return [
      isLoaded,
      isFailure,
      failureMessage,
      directions,
      userBreeds,
      userPets,
      petQuantity,
      percent,
      selectedDirectionId,
      selectedBreedId,
      selectedPetsId,
      petQuantity,
      selectedDateTimeRange,
      selectedStartTimeRange,
      selectedEndTimeRange,
      isStartRange,
      isEndRange,
      isConflict,
      transactions,
    ];
  }
}
