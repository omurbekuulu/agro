import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:agro/presentation/pages/statistics/cubit/statistics_cubit.dart';
import 'package:flutter/material.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/expense_data/expense_data_page.dart';
import 'package:agro/presentation/pages/income_data/income_data_page.dart';
import 'package:agro/presentation/pages/statistics/widgets/custom_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/customLogo.dart';
import '../../../../common/widgets/recording_page.dart';
import '../../../../domain/percent/entity/percent.dart';
import '../../../../domain/transaction/entities/record.dart';
import '../../landing/landing_page.dart';

Widget breedTabBarViewWidget(
  BuildContext context, {
  required int selectedDirectionId,
  required int selectedPetsId,
  required PercentEntity percent,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  final isConflict = context.select((StatisticsCubit b) => b.state.isConflict);

  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      _sumCard(
                        context,
                        title: 'Киреше',
                        subTitle: 'Сумма',
                        sum: percent.income.toString(),
                        onTap: () {
                          AppNavigator.push(context, const IncomeDataPage());
                        },
                      ),
                      const SizedBox(width: 21),
                      _sumCard(
                        context,
                        title: 'Чыгаша',
                        subTitle: 'Сумма',
                        sum: percent.expense.toString(),
                        onTap: () {
                          AppNavigator.push(context, const ExpenseDataPage());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      AppNavigator.push(
                        context,
                        RecordingPage(
                          isInomce: true,
                          priceController: priceController,
                          descriptionController: descriptionController,
                          quantityController: quantityController,
                          isConflict: isConflict,
                          onTap: () async {
                            context.read<StatisticsCubit>().addIncome(
                                  selectedPetId: selectedPetsId,
                                  isDecreas:
                                      selectedDirectionId == 1 ? true : false,
                                  recordEntity: RecordEntity(
                                    price: int.parse(priceController.text),
                                    description: descriptionController.text,
                                    quantity:
                                        int.parse(quantityController.text),
                                  ),
                                );
                            AppNavigator.pushAndRemove(
                                context, const LandingPage());
                          },
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(colors.secondary1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Жаңы киреше кошуу',
                          style: typography.h3.bold
                              .copyWith(color: colors.background),
                        ),
                        Image.asset('assets/add-icon.png'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      AppNavigator.push(
                        context,
                        RecordingPage(
                          isInomce: false,
                          priceController: priceController,
                          descriptionController: descriptionController,
                          quantityController: quantityController,
                          isConflict: isConflict,
                          onTap: () async {
                            context.read<StatisticsCubit>().addExpense(
                                  selectedPetId: selectedPetsId,
                                  recommId: -1,
                                  recordEntity: RecordEntity(
                                    price: int.parse(priceController.text),
                                    description: descriptionController.text,
                                    quantity:
                                        int.parse(quantityController.text),
                                  ),
                                );
                            AppNavigator.pushAndRemove(
                                context, const LandingPage());
                          },
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(colors.secondary1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Кошумча чыгаша кошуу',
                          style: typography.h3.bold
                              .copyWith(color: colors.background),
                        ),
                        Image.asset('assets/add-icon.png'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const CustomGrid(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 24,
        right: 16,
        child: customLogo(),
      )
    ],
  );
}

Widget _sumCard(
  BuildContext context, {
  required String title,
  required String subTitle,
  required String sum,
  required Function() onTap,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Expanded(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      highlightColor: Colors.grey,
      child: Container(
        height: 138,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 1,
            color: colors.secondary1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(42, 24, 39, 75),
              offset: Offset(0, 10),
              blurRadius: 32,
              spreadRadius: -4,
            ),
            BoxShadow(
              color: Color.fromARGB(50, 97, 187, 70),
              offset: Offset(0, 6),
              blurRadius: 14,
              spreadRadius: -6,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24),
                child: Text(
                  title,
                  style: typography.h3.bold,
                ),
              ),
              Text(
                subTitle,
                style: typography.p2.medium,
              ),
              const SizedBox(height: 4),
              Text(
                sum,
                style: typography.h1.bold.copyWith(color: colors.secondary1),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
