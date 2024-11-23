import 'package:agro/presentation/pages/statistics/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Сут',
        'subtitle': '102 литр',
        'type': 'Киреше',
        'amount': '52 000 с',
        'color': Colors.green
      },
      {
        'title': 'Тоют',
        'subtitle': '',
        'type': 'Чыгаша',
        'amount': '112 000 с',
        'color': Colors.green
      },
      {
        'title': 'Даарыло',
        'subtitle': '',
        'type': 'Чыгаша',
        'amount': '112 000 с',
        'color': Colors.green
      },
      {
        'title': 'Башкалар',
        'subtitle': '',
        'type': 'Чыгаша',
        'amount': '52 000 с',
        'color': Colors.green
      },
      {
        'title': 'Мал',
        'subtitle': '',
        'type': 'Киреше',
        'amount': '112 000 с',
        'color': Colors.green
      },
      {
        'title': 'Айлык',
        'subtitle': '',
        'type': 'Чыгаша',
        'amount': '552 000 с',
        'color': Colors.green
      },
    ];

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 21,
        mainAxisSpacing: 24,
        childAspectRatio: 1.5,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final item = items[index];
          return CustomCard(
            title: item['title'] as String,
            subtitle: item['subtitle'] as String,
            type: item['type'] as String,
            amount: item['amount'] as String,
            amountColor: item['color'] as Color,
          );
        },
        childCount: items.length,
      ),
    );
  }
}
