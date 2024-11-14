import 'package:agro/presentation/pages/calculator/calculator_page.dart';
import 'package:agro/presentation/pages/home/home_page.dart';
import 'package:agro/presentation/pages/landing/bloc/bottom_nav_bloc.dart';
import 'package:agro/presentation/pages/landing/widgets/bottom_nav_widget.dart';
import 'package:agro/presentation/pages/notification/notification_page.dart';
import 'package:agro/presentation/pages/profil/profil_page.dart';
import 'package:agro/presentation/pages/statistics/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: const LandingView(),
    );
  }
}

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state.tab) {
            LandingTap.home => const HomePage(),
            LandingTap.statistics => const StatisticsPage(),
            LandingTap.calculator => const CalculatorPage(),
            LandingTap.notification => const NotificationPage(),
            LandingTap.profil => const ProfilPage(),
          },
          bottomNavigationBar: const BottomNavWidget(),
        );
      },
    );
  }
}
