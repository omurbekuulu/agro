import 'package:agro/domain/season/entities/season.dart';
import 'package:agro/domain/season/use_cases/get_seasons.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/entities/breed.dart';
import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../service_locator.dart';

part 'add_new_breed_state.dart';

class AddNewBreedCubit extends Cubit<AddNewBreedState> {
  AddNewBreedCubit() : super(LoadingAddNewBreed());

  void getData() async {
    var responseBreeds = await sl<GetBreedsUseCase>().call();
    var responseSeasons = await sl<GetSeasonsUseCase>().call();

    List<BreedEntity> breeds = [];
    List<SeasonEntity> seasons = [];

    responseBreeds.fold(
      (error) {
        emit(
          FailureLoadAddNewBreed(errorMessage: error),
        );
      },
      (data) {
        breeds = data;
      },
    );

    responseSeasons.fold(
      (error) {
        emit(
          FailureLoadAddNewBreed(errorMessage: error),
        );
      },
      (data) {
        seasons = data;
      },
    );

    emit(
      LoadedAddNewBreed(
        breeds: breeds,
        seasons: seasons,
      ),
    ); 
  }
}
