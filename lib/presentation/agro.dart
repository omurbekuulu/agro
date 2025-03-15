import 'package:agro/presentation/cubit/agro_cubit.dart';
import 'package:agro/presentation/pages/splash/splash_page.dart';
import 'package:agro/presentation/pages/statistics/statistics_page.dart';
import 'package:agro/presentation/pages/weather/weather_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Agro extends StatelessWidget {
  const Agro({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}
