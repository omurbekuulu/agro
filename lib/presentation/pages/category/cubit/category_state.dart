// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

class LoadingCategories extends CategoryState {}

class LoadedCategories extends CategoryState {
  final List<CategoryEntity> categories;

  LoadedCategories({this.categories = const []});

  LoadedCategories copyWith({
    List<CategoryEntity>? categories,
  }) {
    return LoadedCategories(
      categories: categories ?? this.categories,
    );
  }
}

class FailureLaodCategories extends CategoryState {
  final String errorMessage;

  FailureLaodCategories({required this.errorMessage});
}
