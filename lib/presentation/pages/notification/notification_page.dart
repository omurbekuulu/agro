import 'package:agro/presentation/pages/notification/widgets/notification_widget.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Профиль',
                style: typography.h2.bold,
              ),
              const SizedBox(height: 24),
              notificationWidget(
                context,
                'Новая порода коровы',
                'Новая порода коровы улудшить ваш доход рврроврморворор ошокшуомшо шкошмокшом  кшо мшко окшаомшо',
              ),
              const SizedBox(height: 24),
              notificationWidget(
                context,
                'Новая порода коровы',
                'Новая порода коровы улудшить ваш доход рврроврморворор ошокшуомшо шкошмокшом  кшо мшко окшаомшо',
              ),
              const SizedBox(height: 24),
              notificationWidget(
                context,
                'Новая порода коровы',
                'Новая порода коровы улудшить ваш доход',
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
            ],
          ),
        ),
      ),
    );
  }
}
