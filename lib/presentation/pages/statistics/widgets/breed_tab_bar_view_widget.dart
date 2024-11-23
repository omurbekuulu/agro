import 'package:agro/presentation/pages/expense_page.dart';
import 'package:agro/presentation/pages/income_page.dart';
import 'package:agro/presentation/pages/statistics/widgets/custom_grid.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:agro/presentation/uikit/customLogo.dart';
import 'package:flutter/material.dart';

Widget breedTabBarViewWidget(BuildContext context) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 133,
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
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 24),
                              child: Text(
                                'Киреше',
                                style: typography.h3.bold,
                              ),
                            ),
                            Text(
                              'Cумма',
                              style: typography.p2.medium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '552 000 c',
                              style: typography.h1.bold
                                  .copyWith(color: colors.secondary1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 21),
                  Expanded(
                    child: Container(
                      height: 133,
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
                              padding:
                                  const EdgeInsets.only(top: 16, bottom: 24),
                              child: Text(
                                'Чыгаша',
                                style: typography.h3.bold,
                              ),
                            ),
                            Text(
                              'Cумма',
                              style: typography.p2.medium,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '112 000 c',
                              style: typography.h1.bold
                                  .copyWith(color: colors.secondary1),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const IncomePage(),
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.secondary1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Жаңы киреше кошуу',
                      style:
                          typography.h3.bold.copyWith(color: colors.background),
                    ),
                    Image.asset('assets/add-icon.png'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ExpensePage(),
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(colors.secondary1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Кошумча чыгаша кошуу',
                      style:
                          typography.h3.bold.copyWith(color: colors.background),
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
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 40),
              customLogo(),
            ],
          ),
        )
      ],
    ),
  );
}
