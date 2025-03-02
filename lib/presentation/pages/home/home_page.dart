import 'package:agro/domain/percent/entity/percent.dart';
import 'package:agro/presentation/pages/home/cubit/home_cubit.dart';
import 'package:agro/presentation/pages/home/widgets/direction_tab_widget.dart';
import 'package:agro/presentation/pages/home/widgets/stack_weather_profit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..initHome(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (!state.isLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                stackWeatherProfit(context, profitability: state.profitability),
                directionTabWidget(context,
                    selectedDirectionId: state.selectedDirectionId,
                    selectedPetsId: state.selectedPetsId!,
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
          },
        ),
      ),
    );
  }
}
