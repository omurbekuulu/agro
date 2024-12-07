import 'package:agro/domain/breeds/entities/breed.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(LoadingBreeds());

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
