import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:agro/presentation/pages/category/cubit/category_cubit.dart';
import 'package:flutter/material.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/direction/direction_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final colors = Theme.of(context).appColors;

    return BlocProvider(
      create: (context) => CategoryCubit()..initCategories(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is LoadingCategories) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colors.onBackground3,
                  ),
                );
              }
              if (state is FailureLaodCategories) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              if (state is LoadedCategories) {
                return Stack(
                  children: [
                    CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  const SizedBox(height: 40),
                                  Text(
                                    'Багытыңызды тандаңыз',
                                    style: typography.h2.bold,
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    state.categories.first.name,
                                    style: typography.h3.bold,
                                  ),
                                  const SizedBox(height: 12),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.asset(
                                      'assets/cow.jpg',
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: double.infinity,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    state.categories.last.name,
                                    style: typography.h3.bold,
                                  ),
                                  const SizedBox(height: 12),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.asset(
                                      'assets/farm.jpg',
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 70,
                      right: 16,
                      left: 16,
                      child: FilledButton(
                        onPressed: () {
                          AppNavigator.push(
                            context,
                            DirectionPage(
                                categoryId: state.categories.first.id),
                          );
                        },
                        child: Text(state.categories.first.name),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 16,
                      left: 16,
                      child: FilledButton(
                        onPressed: () {},
                        child: Text(state.categories.last.name),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
