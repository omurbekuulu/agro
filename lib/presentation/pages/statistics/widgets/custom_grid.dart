import 'package:agro/domain/transaction/entities/transaction.dart';
import 'package:agro/presentation/pages/statistics/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({
    super.key,
    required this.transactions,
  });

  final List<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 21,
        mainAxisSpacing: 24,
        childAspectRatio: 1.4,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final transaction = transactions[index];
          return CustomCard(
            title: transaction.description,
            subtitle: '',
            profit: transaction.profit,
            price: transaction.price.toString(),
          );
        },
        childCount: transactions.length,
      ),
    );
  }
}
