part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

class InitialNotification extends NotificationState {}

class LoadingNotification extends NotificationState {}

class LoadedNotification extends NotificationState {
  final List<DirectionEntity> directions;
  final int profitability;
  final List<PetEntity> userPets;
  final List<BreedEntity> userBreeds;
  final PercentEntity? percent;
  final List<CardEntity> cards;
  final int selectedDirectionId;
  final int selectedBreedId;
  final int selectedPetsId;

  LoadedNotification({
    this.userPets = const [],
    this.selectedBreedId = 1,
    this.selectedDirectionId = 1,
    this.selectedPetsId = 1,
    this.profitability = 0,
    this.userBreeds = const [],
    this.directions = const [],
    this.percent,
    this.cards = const [],
  });

  LoadedNotification copyWith({
    List<DirectionEntity>? directions,
    List<PetEntity>? userPets,
    int? profitability,
    List<BreedEntity>? userBreeds,
    PercentEntity? percent,
    List<CardEntity>? cards,
    int? selectedDirectionId,
    int? selectedBreedId,
    int? selectedPetsId,
  }) {
    return LoadedNotification(
      directions: directions ?? this.directions,
      userPets: userPets ?? this.userPets,
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

class FailureLoadNotification extends NotificationState {
  final String errorMessage;

  FailureLoadNotification({required this.errorMessage});
}
