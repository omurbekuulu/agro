import 'package:agro/domain/breeds/entities/breed.dart';
import 'package:agro/domain/directions/entity/direction.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../../domain/directions/use_case/get_directoins.dart';
import '../../../../domain/percent/entity/percent.dart';
import '../../../../domain/percent/usecase/get_percent.dart';
import '../../../../domain/pet/entities/pet.dart';
import '../../../../domain/pet/use_cases/get_pets.dart';
import '../../../../domain/recommendation/entity/recommentation.dart';
import '../../../../domain/recommendation/usecase/get_recommendations.dart';
import '../../../service_locator.dart';

part 'statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(LoadingStatistics());

  void updateDirection(DirectionEntity selectedDirection) {
    emit(
      (state as LoadedStatistics).copyWith(selectedDirectionId: selectedDirection.id),
    );
  }

  void updateBreed(BreedEntity selectedBreed) {
    emit(
      (state as LoadedStatistics).copyWith(selectedBreedId: selectedBreed.id),
    );
  }

  void initStatistics() async {
    emit(LoadingStatistics());

    var responseDirections = await sl<GetDirectoinsUseCase>().call(params: 1);
    var responseUserPets = await sl<GetPetsUseCase>().call();
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responseCards = await sl<GetRecommendationsUseCase>().call(
      params: LoadedStatistics().selectedDirectionId,
      params2: LoadedStatistics().selectedBreedId,
    );

    List<DirectionEntity> directions = [];
    int profitability = 0;
    List<PetEntity> userPets = [];
    List<BreedEntity> breeds = [];

    PercentEntity percent = PercentEntity(
      expense: 0,
      income: 0,
      performance: 0,
    );
    List<CardEntity> cards = [];

    responseDirections.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error));
      },
      (data) {
        directions = data;
      },
    );

    responseUserPets.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error));
      },
      (data) {
        userPets = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error));
      },
      (data) {
        breeds = data;
      },
    );

    responseCards.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error));
      },
      (data) {
        cards = data;
      },
    );

    List<BreedEntity> userBreeds = breeds.where((breed) {
      return userPets.any((pet) =>
          pet.directionId == LoadedStatistics().selectedDirectionId &&
          pet.breedId == breed.id);
    }).toList();

    var selectedPet = userPets.first;
    emit(
      LoadedStatistics().copyWith(selectedPetsId: selectedPet.id),
    );

    var responsePercent =
        await sl<GetPercentUseCase>().call(params: selectedPet.id);

    responsePercent.fold(
      (error) {
        emit(FailureLoadStatistics(errorMessage: error['message']));
      },
      (data) {
        percent = data;
      },
    );

    emit(
      LoadedStatistics(
        directions: directions,
        profitability: profitability,
        userBreeds: userBreeds,
        percent: percent,
        cards: cards,
        selectedPetsId: selectedPet.id!,
      ),
    );
  }
}
