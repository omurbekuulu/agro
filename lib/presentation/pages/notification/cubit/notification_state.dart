part of 'notification_cubit.dart';

@immutable
class NotificationState extends Equatable {
  final bool isLoaded;
  final List<DirectionEntity> directions;
  final List<BreedEntity> userBreeds;
  final List<CardEntity> cards;
  final int selectedDirectionId;
  final int? selectedBreedId;

  const NotificationState({
    this.isLoaded = false,
    this.userBreeds = const [],
    this.directions = const [],
    this.cards = const [],
    this.selectedBreedId,
    this.selectedDirectionId = 1,
  });

  NotificationState copyWith({
    bool? isLoaded,
    List<DirectionEntity>? directions,
    List<BreedEntity>? userBreeds,
    List<CardEntity>? cards,
    int? selectedDirectionId,
    int? selectedBreedId,
  }) {
    return NotificationState(
      isLoaded: isLoaded ?? this.isLoaded,
      directions: directions ?? this.directions,
      userBreeds: userBreeds ?? this.userBreeds,
      cards: cards ?? this.cards,
      selectedDirectionId: selectedDirectionId ?? this.selectedDirectionId,
      selectedBreedId: selectedBreedId ?? this.selectedBreedId,
    );
  }

  @override
  List<Object?> get props => [
        directions,
        userBreeds,
        cards,
        selectedDirectionId,
        selectedBreedId,
      ];
}

class FailureLoadNotification extends NotificationState {
  final String errorMessage;

  const FailureLoadNotification({required this.errorMessage});
}
