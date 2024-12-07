import 'package:agro/common/widgets/customLogo.dart';
import 'package:agro/presentation/pages/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';

Widget breedTabBarViewWidget(BuildContext context) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
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
                'Новая порода коровы улудшить ваш доход рврроврморворор ошокшуомшо шкошмокшом  кшо мшко окшаомшо',
              ),
              const SizedBox(height: 24),
              notificationCard(
                context,
                'Новая порода коровы',
                'Новая порода коровы улудшить ваш',
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
                'Новая порода коровы улудшить ваш доход рврроврморворор ошокшуомшо шкошмокшом  кшо мшко окшаомшо',
              ),
              const SizedBox(height: 24),
              notificationCard(
                context,
                'Новая порода коровы',
                'Новая порода коровы улудшить ваш',
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
