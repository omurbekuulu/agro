import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/add_new_pet/add_new_pet_page.dart';
import 'package:agro/presentation/pages/direction/cubit/direction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DirectionPage extends StatelessWidget {
  const DirectionPage({super.key, required this.categoryId});

  final int categoryId;

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;

    return BlocProvider(
      create: (context) => DirectionCubit()..initDirections(categoryId),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<DirectionCubit, DirectionState>(
            builder: (context, state) {
              if (state is FailureLaodDirections) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              if (state is LoadingDirections) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoadedDirections) {
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
                                    state.directions.last.name!,
                                    style: typography.h3.bold,
                                  ),
                                  const SizedBox(height: 12),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: SvgPicture.asset(
                                      'assets/meat.svg',
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: double.infinity,
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    state.directions.first.name!,
                                    style: typography.h3.bold,
                                  ),
                                  const SizedBox(height: 12),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: SvgPicture.asset(
                                      'assets/milk.svg',
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
                          AppNavigator.pushAndRemove(
                              context, const AddNewPetPage());
                        },
                        child: Text(
                          state.directions.last.name!,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 16,
                      left: 16,
                      child: FilledButton(
                        onPressed: () {},
                        child: Text(
                          state.directions.first.name!,
                        ),
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
