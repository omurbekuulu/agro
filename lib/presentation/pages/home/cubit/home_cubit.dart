import 'package:agro/domain/breeds/entities/breed.dart';
import 'package:agro/domain/directions/entity/direction.dart';
import 'package:agro/domain/directions/use_case/get_directoins.dart';
import 'package:agro/domain/percent/entity/percent.dart';
import 'package:agro/domain/percent/usecase/get_percent.dart';
import 'package:agro/domain/profitability/usecase/get_profitability.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHome());

  void initHome({
    required int categoryId,
    required int directionId,
    required int petId,
  }) async {
    emit(LoadingHome());
    var responseDirections =
        await sl<GetDirectoinsUseCase>().call(params: categoryId);
    var responseProfibility =
        await sl<GetProfitabilityUseCase>().call(params: directionId);
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responsePercent = await sl<GetPercentUseCase>().call(params: petId);

    List<DirectionEntity> directions = [];
    int profitability = 0;
    List<BreedEntity> breeds = [];
    PercentEntity? percent;

    responseDirections.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        directions = data;
      },
    );

    responseProfibility.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        profitability = data;
      },
    );

    responseBreeds.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        breeds = data;
      },
    );

    responsePercent.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        percent = data;
      },
    );

    emit(
      LoadedHome(
        directions: directions,
        profitability: profitability,
        breeds: breeds,
        percent: percent!,
      ),
    );
  }
}
