import 'package:agro/domain/category/repository/category.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetAllCategoriesUseCase {
  Future<Either> call() async {
    return await sl<CategoryRepository>().getAllCategory();
  }
}
