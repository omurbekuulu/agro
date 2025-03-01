import 'package:agro/domain/category/entity/category.dart';

import '../../../data/category/model/category.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
    );
  }
}
