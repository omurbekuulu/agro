import 'package:agro/domain/category/usecase/get_all_categories.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../domain/category/entity/category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(LoadingCategories());

  void initCategories() async {
    final responseCategories = await sl<GetAllCategoriesUseCase>().call();

    responseCategories.fold(
      (error) {
        emit(
          FailureLaodCategories(errorMessage: error),
        );
      },
      (data) {
        emit(
          LoadedCategories().copyWith(categories: data),
        );
      },
    );
  }
}
