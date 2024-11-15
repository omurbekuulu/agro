import 'package:agro/presentation/theme/theme.dart';
import 'package:agro/presentation/uikit/customTextFormField.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Калькулятор',
                style: typography.h2.bold,
              ),
              const SizedBox(height: 29),
              Text(
                'Саны',
                style: typography.p1.medium.copyWith(
                  color: colors.secondary1,
                ),
              ),
              const SizedBox(height: 4),
              customTextFormField(context,
                  inputType: TextInputType.number, hintText: '0'),
              const SizedBox(height: 16),
              Text(
                'Саны',
                style: typography.p1.medium.copyWith(
                  color: colors.secondary1,
                ),
              ),
              const SizedBox(height: 4),
              customTextFormField(context,
                  inputType: TextInputType.number, hintText: '0'),
              const SizedBox(height: 16),
              Text(
                'Саны',
                style: typography.p1.medium.copyWith(
                  color: colors.secondary1,
                ),
              ),
              const SizedBox(height: 4),
              customTextFormField(context,
                  inputType: TextInputType.number, hintText: '0'),
            ],
          ),
        ),
      ),
    );
  }
}
