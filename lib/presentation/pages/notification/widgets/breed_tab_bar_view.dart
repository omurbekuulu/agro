import 'package:agro/common/widgets/customLogo.dart';
import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/domain/recommendation/entity/recommentation.dart';
import 'package:flutter/material.dart';

Widget breedTabBarViewWidget(
  BuildContext context, {
  required List<CardEntity> cards,
}) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildExpansionTiles(
                context,
                cards,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 24,
        right: 16,
        child: customLogo(),
      ),
    ],
  );
}

Widget buildExpansionTiles(BuildContext context, List<CardEntity> cards) {
  final typography = Theme.of(context).appTypography;
  final colors = Theme.of(context).appColors;

  return Column(
    children: List.generate(cards.length, (index) {
      return ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          cards[index].name,
          style: typography.p1.bold.copyWith(color: colors.primary),
        ),
        trailing: Icon(Icons.arrow_drop_down, color: colors.onBackground3),
        children:
            List.generate(cards[index].recommendations.length, (innerIndex) {
          final recomms = cards[index].recommendations;
          return Card(
            color: colors.onBackground,
            elevation: 0,
            margin: const EdgeInsets.only(top: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                recomms[innerIndex].name,
                style: typography.p1.semiBold,
              ),
              subtitle: Text(recomms[innerIndex].description),
            ),
          );
        }),
      );
    }),
  );
}
