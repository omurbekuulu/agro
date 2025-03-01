import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:agro/presentation/pages/add_new_pet/add_new_pet_page.dart';
import 'package:flutter/material.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/recording_page.dart';
import '../../../../domain/percent/entity/percent.dart';
import '../../../../domain/recommendation/entity/recommentation.dart';
import '../../../../domain/transaction/entities/record.dart';
import '../../landing/landing_page.dart';
import '../cubit/home_cubit.dart';
import 'show_dialog_widgets.dart';

Widget breedTabBarViewWidget(
  BuildContext context, {
  required selectedDirectionId,
  required int selectedPetsId,
  required PercentEntity percent,
  required List<CardEntity> cards,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FilledButton(
            onPressed: () {
              AppNavigator.pushAndRemove(
                  context, AddNewPetPage(directionId: selectedDirectionId));
            },
            child: const Text('Жаңы порода кошуу'),
          ),
          const SizedBox(height: 24),
          Container(
            height: 84,
            decoration: BoxDecoration(
              color: colors.onBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Чыгаша: ${percent.expense}'),
                      Text('Киреше: ${percent.income}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('Пароданын түшүмдүлүгү: ${percent.performance}'),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Кошумча чыгаша кошуу',
                  style: typography.p1.bold,
                ),
                InkWell(
                  overlayColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  splashColor: colors.onBackground,
                  onTap: () {
                    AppNavigator.push(
                      context,
                      RecordingPage(
                        priceController: priceController,
                        descriptionController: descriptionController,
                        quantityController: quantityController,
                        onTap: () async {
                          context.read<HomeCubit>().addExpense(
                                selectedPetId: selectedPetsId,
                                recommId: -1,
                                recordEntity: RecordEntity(
                                  price: int.parse(priceController.text),
                                  description: descriptionController.text,
                                  quantity: int.parse(quantityController.text),
                                ),
                              );
                          AppNavigator.pushAndRemove(
                              context, const LandingPage());
                        },
                      ),
                    );
                  },
                  child: Image.asset('assets/add-icon.png'),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Жаңы киреше кошуу',
                  style: typography.p1.bold,
                ),
                InkWell(
                  overlayColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  splashColor: colors.onBackground,
                  onTap: () {
                    AppNavigator.push(
                      context,
                      RecordingPage(
                        priceController: priceController,
                        descriptionController: descriptionController,
                        quantityController: quantityController,
                        onTap: () async {
                          context.read<HomeCubit>().addIncome(
                                selectedPetId: selectedPetsId,
                                isDecreas:
                                    selectedDirectionId == 1 ? true : false,
                                recordEntity: RecordEntity(
                                  price: int.parse(priceController.text),
                                  description: descriptionController.text,
                                  quantity: int.parse(quantityController.text),
                                ),
                              );
                          AppNavigator.pushAndRemove(
                              context, const LandingPage());
                        },
                      ),
                    );
                  },
                  child: Image.asset('assets/add-icon.png'),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Column(
            children: List.generate(cards.length, (index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      height: 28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cards[index].name,
                            style: typography.p1.bold.copyWith(
                              color: colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(cards[index].recommendations.length,
                        (innerIndex) {
                      final name =
                          cards[index].recommendations[innerIndex].name;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: SizedBox(
                          height: 28,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(name, style: typography.p1.bold),
                              InkWell(
                                onTap: () async {
                                  showDialogWidget(
                                    context,
                                    selectedPetsId: selectedPetsId,
                                    recommendationId: cards[index]
                                        .recommendations[innerIndex]
                                        .id,
                                    card: cards[index],
                                  );
                                },
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: colors.onBackground,
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: colors.secondary1),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    ),
  );
}
