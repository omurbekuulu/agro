import 'package:agro/presentation/pages/home/cubit/home_cubit.dart';
import 'package:agro/presentation/pages/home/widgets/direction_tab_widget.dart';
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
          create: (context) => HomeCubit()
            ..initHome(
              categoryId: 1,
              directionId: 5,
              petId: 1,
              breedId: 1,
            ), //TODO: implement these response datas
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
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    stackWeatherProfit(context),
                    directionTabWidget(context,
                        tabDirectionNames: state.directions
                            .map((directoin) => directoin.name)
                            .toList(),
                        tabBreedNames:
                            state.breeds.map((breed) => breed.name).toList(),
                        percent: state.percent,
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
