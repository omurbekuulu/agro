import 'dart:math';
import 'package:flutter/material.dart';
import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/calculator/widget/list_tile_data.dart';
import '../../../common/widgets/customLogo.dart';
import '../../../common/widgets/customTextFormField.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController loanController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController termController = TextEditingController();

  String dropdownButtonValue = 'Ай';
  double monthlyPayment = 0;
  double totalPayment = 0;
  double overpayment = 0;
  bool isValid = false;

  void _validateForm() {
    setState(() {
      isValid = _formKey.currentState?.validate() ?? false;
    });
  }

  void calculateAnnuity() {
    if (!isValid) return;

    double loanAmount = double.tryParse(loanController.text) ?? 0;
    double annualRate = double.tryParse(rateController.text) ?? 0;
    int term = int.tryParse(termController.text) ?? 0;

    if (dropdownButtonValue == 'Жыл') {
      term *= 12;
    }

    double monthlyRate = (annualRate / 100) / 12;
    if (monthlyRate == 0 || term == 0) {
      setState(() {
        monthlyPayment = loanAmount / (term == 0 ? 1 : term);
        totalPayment = monthlyPayment * term;
        overpayment = totalPayment - loanAmount;
      });
      return;
    }

    double annuityFactor = (monthlyRate * pow(1 + monthlyRate, term)) /
        (pow(1 + monthlyRate, term) - 1);

    setState(() {
      monthlyPayment = loanAmount * annuityFactor;
      totalPayment = monthlyPayment * term;
      overpayment = totalPayment - loanAmount;
    });
  }

  @override
  void initState() {
    super.initState();
    loanController.addListener(_validateForm);
    rateController.addListener(_validateForm);
    termController.addListener(_validateForm);
  }

  @override
  void dispose() {
    loanController.dispose();
    rateController.dispose();
    termController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text('Калькулятор', style: typography.h2.bold),
                  const SizedBox(height: 29),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Насыянын суммасы',
                                  style: typography.p1.medium.copyWith(
                                    color: colors.secondary1,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                customTextFormField(
                                  context,
                                  controller: loanController,
                                  inputType: TextInputType.number,
                                  hintText: '0 с',
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Text(
                                      'Насыянын проценти',
                                      style: typography.p1.medium.copyWith(
                                        color: colors.secondary1,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text('Аннуитетный',
                                        style: typography.p2.medium),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                customTextFormField(
                                  context,
                                  controller: rateController,
                                  inputType: TextInputType.number,
                                  hintText: '0',
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Насыянын убактысы',
                                  style: typography.p1.medium.copyWith(
                                    color: colors.secondary1,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Expanded(
                                      child: customTextFormField(
                                        context,
                                        controller: termController,
                                        inputType: TextInputType.number,
                                        hintText: '0',
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: Container(
                                        height: 56,
                                        decoration: BoxDecoration(
                                          color: colors.onBackground,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 16,
                                        ),
                                        child: DropdownButton(
                                          value: dropdownButtonValue,
                                          dropdownColor: colors.onBackground,
                                          isExpanded: true,
                                          underline: Container(),
                                          items: const [
                                            DropdownMenuItem(
                                              value: 'Ай',
                                              child: Text('Ай'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Жыл',
                                              child: Text('Жыл'),
                                            ),
                                          ],
                                          onChanged: (newValue) {
                                            setState(() {
                                              dropdownButtonValue = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                listTileData(
                                  context,
                                  title: 'Бир айдын суммасы',
                                  data:
                                      '${monthlyPayment.toStringAsFixed(2)} с',
                                ),
                                listTileData(
                                  context,
                                  title: 'Бериле турчу баардык сумма',
                                  data: '${totalPayment.toStringAsFixed(2)} с',
                                ),
                                listTileData(
                                  context,
                                  title: 'Ашыкча төлөм',
                                  data: '${overpayment.toStringAsFixed(2)} с',
                                ),
                                const SizedBox(height: 125),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(bottom: 74, right: 16, child: customLogo()),
            Positioned(
              bottom: 12,
              right: 16,
              left: 16,
              child: FilledButton(
                onPressed: isValid ? calculateAnnuity : null,
                child: const Text('Санап берүү'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
