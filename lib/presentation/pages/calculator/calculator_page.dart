import 'package:agro/presentation/pages/calculator/widget/list_tile_data.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:agro/presentation/uikit/customLogo.dart';
import 'package:agro/presentation/uikit/customTextFormField.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;
    String dropdownButtonValue = 'Ай';

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
                  Text(
                    'Калькулятор',
                    style: typography.h2.bold,
                  ),
                  const SizedBox(height: 29),
                  Expanded(
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
                                  Text(
                                    'Аннуитетный',
                                    style: typography.p2.medium,
                                  )
                                ],
                              ),
                              const SizedBox(height: 4),
                              customTextFormField(
                                context,
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
                                        borderRadius: BorderRadius.circular(12),
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
                                  )
                                ],
                              ),
                              listTileData(
                                context,
                                title: 'Бир айдын суммасы',
                                data: '0 с',
                              ),
                              listTileData(
                                context,
                                title: 'Бериле турчу баардык сумма',
                                data: '0 с',
                              ),
                              listTileData(
                                context,
                                title: 'Ашыкча төлөм',
                                data: '0 с',
                              ),
                              const SizedBox(height: 125),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 74,
              right: 16,
              child: customLogo(),
            ),
            Positioned(
              bottom: 12,
              right: 16,
              left: 16,
              child: FilledButton(
                onPressed: () {},
                child: const Text('Санап берүү'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
