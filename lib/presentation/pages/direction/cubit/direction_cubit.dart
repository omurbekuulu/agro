import 'package:agro/domain/directions/entity/direction.dart';
import 'package:agro/domain/directions/use_case/get_directoins.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../service_locator.dart';

part 'direction_state.dart';

class DirectionCubit extends Cubit<DirectionState> {
  DirectionCubit() : super(LoadingDirections());

  void initDirections(int categoryId) async {
    final responseDirections =
        await sl<GetDirectoinsUseCase>().call(params: categoryId);

    responseDirections.fold(
      (error) {
        emit(
          FailureLaodDirections(errorMessage: error),
        );
      },
      (data) {
        emit(
          LoadedDirections().copyWith(directions: data),
        );
      },
    );
  }
}
