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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text(
          'Кошумча чыгаша',
          style: typography.h2.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
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
              customTextFormField(context, hintText: '0 с'),
              const SizedBox(height: 24),
              Text(
                'Комментарий (Аты)',
                style: typography.p1.medium.copyWith(
                  color: colors.secondary1,
                ),
              ),
              const SizedBox(height: 4),
              customTextFormField(context, hintText: 'Сумма'),
              const SizedBox(height: 24),
              Text(
                'Саны',
                style: typography.p1.medium.copyWith(
                  color: colors.secondary1,
                ),
              ),
              customTextFormField(context, hintText: '0'),
              const SizedBox(height: 4),
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
                child: Text(
                  'Кошуу',
                  style: typography.h3.bold,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}