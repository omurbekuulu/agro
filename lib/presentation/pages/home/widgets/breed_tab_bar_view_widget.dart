import 'package:agro/presentation/pages/expense_page.dart';
import 'package:agro/presentation/pages/income_page.dart';
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
                          _showDialog(context);
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

Future _showDialog(BuildContext context) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Кошуу',
            style: typography.h3.bold.copyWith(color: colors.background),
          ),
        )
      ],
      title: Text(
        'Сумма',
        style: typography.h3.bold,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colors.secondary1),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.secondary1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.secondary1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Канча сом кеткенин жазыңыз',
            style: typography.p2.medium.copyWith(color: colors.onBackground2),
          ),
          const SizedBox(height: 4),
          Text(
            'Эгер 0 с болсо жөн эле кошууну басыңыз',
            style: typography.p2.medium.copyWith(color: colors.onBackground2),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}
