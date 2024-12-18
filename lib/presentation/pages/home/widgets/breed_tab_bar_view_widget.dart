import 'package:flutter/material.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/add_new_breed/add_new_breed_page.dart';
import 'package:agro/presentation/pages/expense_page.dart';
import 'package:agro/presentation/pages/income_page.dart';
import 'package:agro/presentation/pages/profil/widgets/show_dialog_widget.dart';

import '../../../../domain/percent/entity/percent.dart';

Widget breedTabBarViewWidget(
  BuildContext context, {
  required PercentEntity percent,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const AddNewBreedPage()),
              );
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ExpensePage(),
                    ));
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const IncomePage(),
                    ));
                  },
                  child: Image.asset('assets/add-icon.png'),
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Column(
            children: List.generate(14, (index) {
              if (index == 0 || index % 4 == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    height: 28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'До беременности',
                          style: typography.p1.bold.copyWith(
                            color: colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: SizedBox(
                  height: 28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Новый корм', style: typography.p1.bold),
                      InkWell(
                        onTap: () {
                          showDialogWidget(context);
                        },
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            color: colors.onBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: colors.secondary1),
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
      ),
    ),
  );
}
