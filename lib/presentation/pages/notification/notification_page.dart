import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/notification/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/direction_tab_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..initNotification(),
      child: const NotificationView(),
    );
  }
}

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (!state.isLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Рекомендации',
                    style: typography.h2.bold,
                  ),
                ),
                const SizedBox(height: 24),
                directionTabWidget(
                  context,
                  tabDirections: state.directions,
                  tabBreeds: state.userBreeds,
                  cards: state.cards,
                ),
                const SizedBox(height: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
