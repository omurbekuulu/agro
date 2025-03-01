import 'package:agro/common/helper/mapper/category_mapper.dart';
import 'package:agro/data/category/model/category.dart';
import 'package:agro/data/category/source/category.dart';
import 'package:agro/domain/category/repository/category.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getAllCategory() async {
    final responseCategories = await sl<CategoryService>().getAllCategory();

    return responseCategories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final categoreis = List.from(data)
            .map((category) =>
                CategoryMapper.toEntity(CategoryModel.fromJson(category)))
            .toList();
        return Right(categoreis);
      },
    );
  }
}
