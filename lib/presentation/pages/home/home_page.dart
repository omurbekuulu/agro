import 'package:agro/presentation/pages/home/cubit/home_cubit.dart';
import 'package:agro/presentation/pages/home/widgets/breed_tab_bar_view_widget.dart';
import 'package:agro/presentation/pages/home/widgets/main_tabs_widget.dart';
import 'package:agro/presentation/pages/home/widgets/stack_weather_profit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/customBreedTabBar.dart';

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
          create: (context) => HomeCubit()..getBreeds(),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is LoadingBreeds) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is FailureLoadBreeds) {
                return Center(
                  child: Text(
                    state.errorMessage,
                  ),
                );
              }
              if (state is LoadedBreeds) {
                return Column(
                  children: [
                    stackWeatherProfit(context),
                    mainTabsWidget(
                      context,
                    ),
                    const SizedBox(height: 24),
                    customBreedTabBar(
                      context,
                      tabs: state.breeds.map((breed) => breed.name).toList(),
                      tabBarViews: breedTabBarViewWidget(context),
                    )
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
