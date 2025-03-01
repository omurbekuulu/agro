import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/notification/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/percent/entity/percent.dart';
import 'widgets/direction_tab_bar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;

    return BlocProvider(
      create: (context) => NotificationCubit()..initNotification(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              if (state is LoadingNotification) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is FailureLoadNotification) {
                return Center(
                  child: Text(
                    state.errorMessage,
                  ),
                );
              }
              if (state is LoadedNotification) {
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
                    directionTabWidget(context,
                        selectedDirectionId: state.selectedDirectionId,
                        selectedPetsId: state.selectedPetsId,
                        tabDirections: state.directions,
                        tabBreeds: state.userBreeds,
                        percent: state.percent ??
                            PercentEntity(
                              expense: 0,
                              income: 0,
                              performance: 0,
                            ),
                        cards: state.cards),
                    const SizedBox(height: 24),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
