import 'package:agro/presentation/theme/theme.dart';
import 'package:agro/presentation/uikit/customTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Кошумча чыгаша',
                      style: typography.h2.bold,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Артка кайтуу',
                        style: typography.p1.bold.copyWith(color: Colors.black),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      Text(
                        'Сумма',
                        style: typography.p1.medium.copyWith(
                          color: colors.secondary1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      customTextFormField(context,
                          inputType: TextInputType.number, hintText: '0 с'),
                      const SizedBox(height: 24),
                      Text(
                        'Комментарий (Аты)',
                        style: typography.p1.medium.copyWith(
                          color: colors.secondary1,
                        ),
                      ),
                      const SizedBox(height: 4),
                      customTextFormField(context,
                          inputType: TextInputType.text,
                          hintText: 'Кошумча сөздөр'),
                      const SizedBox(height: 24),
                      Text(
                        'Саны',
                        style: typography.p1.medium.copyWith(
                          color: colors.secondary1,
                        ),
                      ),
                      customTextFormField(context,
                          inputType: TextInputType.number, hintText: '0'),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/logo.svg',
                      width: 57,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Кошуу'),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
