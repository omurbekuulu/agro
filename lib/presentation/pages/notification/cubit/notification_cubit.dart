import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/entities/breed.dart';
import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../../domain/directions/entity/direction.dart';
import '../../../../domain/directions/use_case/get_directoins.dart';
import '../../../../domain/percent/entity/percent.dart';
import '../../../../domain/pet/entities/pet.dart';
import '../../../../domain/pet/use_cases/get_pets.dart';
import '../../../../domain/recommendation/entity/recommentation.dart';
import '../../../../domain/recommendation/usecase/get_recommendations.dart';
import '../../../service_locator.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(InitialNotification());

  void updateDirection(DirectionEntity selectedDirection) {
    emit(
      (state as LoadedNotification)
          .copyWith(selectedDirectionId: selectedDirection.id),
    );
  }

  void updateBreed(BreedEntity selectedBreed) {
    emit(
      (state as LoadedNotification).copyWith(selectedBreedId: selectedBreed.id),
    );
  }

  void initNotification() async {
    emit(LoadingNotification());

    List<DirectionEntity> directions = [];
    List<PetEntity> userPets = [];
    List<BreedEntity> userBreeds = [];
    List<CardEntity> cards = [];

    var responseDirections = await sl<GetDirectoinsUseCase>().call(params: 1);
    var responseUserPets = await sl<GetPetsUseCase>().call();
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: LoadedNotification().selectedDirectionId,
      params2: LoadedNotification().selectedBreedId,
    );

    responseDirections.fold(
      (error) {
        emit(FailureLoadNotification(errorMessage: error));
        return;
      },
      (data) {
        directions = data;
      },
    );

    responseUserPets.fold(
      (error) {
        emit(FailureLoadNotification(errorMessage: error));
      },
      (data) {
        userPets = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(FailureLoadNotification(errorMessage: error));
      },
      (data) {
        List<BreedEntity> userBreedsSorted = data.where((breed) {
          return userPets.any((pet) =>
              pet.directionId == LoadedNotification().selectedDirectionId &&
              pet.breedId == breed.id);
        }).toList();
        userBreeds = userBreedsSorted;
      },
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadNotification(errorMessage: error));
      },
      (data) {
        cards = data;
      },
    );

    var selectedPet = userPets.first;

    emit(
      LoadedNotification().copyWith(
        directions: directions,
        userPets: userPets,
        selectedPetsId: selectedPet.id,
        userBreeds: userBreeds,
        cards: cards,
      ),
    );
  }
}
