import 'package:agro/presentation/pages/notification/widgets/notification_card.dart';
import 'package:agro/presentation/uikit/customLogo.dart';
import 'package:flutter/material.dart';

Widget breedTabBarViewWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        notificationCard(
          context,
          'Новая порода коровы',
          'Новая порода коровы улудшить ваш доход рврроврморворор ошокшуомшо шкошмокшом  кшо мшко окшаомшо',
        ),
        const SizedBox(height: 24),
        notificationCard(
          context,
          'Новая порода коровы',
          'Новая порода коровы улудшить ваш доход рврроврморворор ошокшуомшо шкошмокшом  кшо мшко окшаомшо',
        ),
        const SizedBox(height: 24),
        notificationCard(
          context,
          'Новая порода коровы',
          'Новая порода коровы улудшить ваш',
        ),
        const Spacer(),
        customLogo(),
      ],
    ),
  );
}