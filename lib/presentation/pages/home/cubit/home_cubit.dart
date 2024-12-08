import 'package:agro/domain/breeds/entities/breed.dart';
import 'package:agro/domain/profitability/usecase/get_profitability.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/breeds/use_cases/get_breeds.dart';
import '../../../service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHome());

  void initHome(int directionId) async {
    emit(LoadingHome());
    var profitability =
        await sl<GetProfitabilityUseCase>().call(params: directionId);
    var breeds = await sl<GetBreedsUseCase>().call();

    profitability.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        emit(
          LoadedHome(profitability: data),
        );
      },
    );

    breeds.fold(
      (error) {
        emit(FailureLoadHome(errorMessage: error));
      },
      (data) {
        emit(LoadedHome(breeds: data));
      },
    );
  }
}
