import 'package:agro/presentation/pages/animal_amount/animal_amount_page.dart';
import 'package:agro/presentation/pages/expense_page.dart';
import 'package:agro/presentation/pages/income_page.dart';
import 'package:agro/presentation/pages/profil/widgets/show_dialog_widget.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

Widget breedTabBarViewWidget(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => const AnimalAmountPage()),
              );
            },
            child: const Text('Малдын санын көрсөтүңүз'),
          ),
          const SizedBox(height: 24),
          Container(
            height: 84,
            decoration: BoxDecoration(
              color: colors.onBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Чыгаша: 0'),
                      Text('Киреше: 0'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text('Түшүмдүүлүгү: 0%'),
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
