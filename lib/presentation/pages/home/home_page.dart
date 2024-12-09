import 'package:agro/presentation/pages/home/cubit/home_cubit.dart';
import 'package:agro/presentation/pages/home/widgets/main_tabs_widget.dart';
import 'package:agro/presentation/pages/home/widgets/stack_weather_profit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              HomeCubit()..initHome(categoryId: 1, directionId: 5, petId: 1),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is LoadingHome) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is FailureLoadHome) {
                return Center(
                  child: Text(
                    state.errorMessage,
                  ),
                );
              }
              if (state is LoadedHome) {
                return ListView(
                  shrinkWrap: true,
                  children: [
                    stackWeatherProfit(context),
                    mainTabsWidget(
                      context,
                      tabDirections: state.directions
                          .map((directoin) => directoin.name)
                          .toList(),
                      tabBreeds:
                          state.breeds.map((breed) => breed.name).toList(),
                      percent: state.percent,
                    ),
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
