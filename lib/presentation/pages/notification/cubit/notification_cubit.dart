import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/entities/breed.dart';
import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../../domain/directions/entity/direction.dart';
import '../../../../domain/directions/use_case/get_directoins.dart';
import '../../../../domain/pet/entities/pet.dart';
import '../../../../domain/pet/use_cases/get_pets.dart';
import '../../../../domain/recommendation/entity/recommentation.dart';
import '../../../../domain/recommendation/usecase/get_recommendations.dart';
import '../../../service_locator.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState());

  void updateDirection(DirectionEntity selectedDirection) async {
    List<PetEntity> userPets = [];
    List<BreedEntity> userBreeds = [];

    var responseUserPets = await sl<GetPetsUseCase>().call();
    var responseBreeds = await sl<GetBreedsUseCase>().call();
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
        List<BreedEntity> breeds = data;
        List<BreedEntity> userBreedsSorted = breeds.where((breed) {
          return userPets.any((pet) =>
              pet.directionId == selectedDirection.id &&
              pet.breedId == breed.id);
        }).toList();
        userBreeds = userBreedsSorted;
      },
    );

    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: selectedDirection.id,
      params2: userBreeds.first.id,
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadNotification(errorMessage: error));
      },
      (data) {
        emit(
          (state).copyWith(
            selectedDirectionId: selectedDirection.id,
            userBreeds: userBreeds,
            cards: data,
          ),
        );
      },
    );
  }

  void updateBreed(BreedEntity selectedBreed) async {
    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: state.selectedDirectionId,
      params2: selectedBreed.id,
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadNotification(errorMessage: error));
      },
      (data) {
        emit(
          (state).copyWith(
            cards: data,
          ),
        );
      },
    );
  }

  void initNotification() async {
    (state.copyWith(isLoaded: false),);

    List<DirectionEntity> directions = [];
    List<PetEntity> userPets = [];
    List<BreedEntity> userBreeds = [];
    List<CardEntity> cards = [];

    var responseDirections = await sl<GetDirectoinsUseCase>().call(params: 1);
    var responseUserPets = await sl<GetPetsUseCase>().call();
    var responseBreeds = await sl<GetBreedsUseCase>().call();

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
        List<BreedEntity> breeds = data;
        List<BreedEntity> userBreedsSorted = breeds.where((breed) {
          return userPets.any((pet) =>
              pet.directionId == state.selectedDirectionId &&
              pet.breedId == breed.id);
        }).toList();
        userBreeds = userBreedsSorted;
      },
    );

    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: state.selectedDirectionId,
      params2: state.selectedBreedId ?? userBreeds.first.id,
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadNotification(errorMessage: error));
      },
      (data) {
        cards = data;
      },
    );

    emit(
      state.copyWith(
        isLoaded: true,
        directions: directions,
        userBreeds: userBreeds,
        selectedDirectionId: 1,
        selectedBreedId: userBreeds.first.id,
        cards: cards,
      ),
    );
  }
}
