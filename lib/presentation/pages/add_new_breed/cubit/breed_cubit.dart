import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/add_new_breed/entities/breed.dart';
import '../../../../domain/add_new_breed/use_cases/get_breeds.dart';
import '../../../service_locator.dart';

part 'breed_state.dart';

class BreedCubit extends Cubit<BreedsState> {
  BreedCubit() : super(LoadingBreeds());

  void getBreeds() async {
    var responseData = await sl<GetBreedsUseCase>().call();

    responseData.fold(
      (error) {
        emit(
          FailureLoadBreeds(errorMessage: error),
        );
      },
      (data) {
        emit(
          LoadedBreeds(breeds: data),
        );
      },
    );
  }
}
