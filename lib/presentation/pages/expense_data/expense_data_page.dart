import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/expense_data/widget/custom_list_tile.dart';

class ExpenseDataPage extends StatelessWidget {
  const ExpenseDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final mediaWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset('assets/back-icon.svg'),
                  ),
                  const SizedBox(width: 24),
                  Text(
                    'Чыгаша',
                    style: typography.h3.bold,
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/calendar-icon.svg'),
                ],
              ),
              const SizedBox(height: 29),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Text('Аталышы'),
                    SizedBox(width: mediaWidth * 0.32),
                    const Text('Саны'),
                    const Spacer(),
                    const Text('Сумма'),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        '12.11.24',
                        style: typography.p2.medium,
                      ),
                      const SizedBox(height: 8),
                      customListTile(context),
                      const SizedBox(height: 12),
                      customListTile(context),
                      const SizedBox(height: 24),
                      Text(
                        '12.11.24',
                        style: typography.p2.medium,
                      ),
                      const SizedBox(height: 8),
                      customListTile(context),
                      const SizedBox(height: 12),
                      customListTile(context),
                      const SizedBox(height: 12),
                      customListTile(context),
                      const SizedBox(height: 24),
                      Text(
                        '12.11.24',
                        style: typography.p2.medium,
                      ),
                      const SizedBox(height: 8),
                      customListTile(context),
                      const SizedBox(height: 12),
                      customListTile(context),
                      const SizedBox(height: 12),
                      customListTile(context),
                      const SizedBox(height: 12),
                      customListTile(context),
                      const SizedBox(height: 12),
                      customListTile(context),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
