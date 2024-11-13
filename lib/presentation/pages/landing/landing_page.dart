import 'package:agro/presentation/pages/home/home_page.dart';
import 'package:agro/presentation/pages/landing/bloc/bottom_nav_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          body: switch (state.tap) {
            LandingTap.home => const HomePage(),
            LandingTap.statistics => throw UnimplementedError(),
            LandingTap.calculator => throw UnimplementedError(),
            LandingTap.notification => throw UnimplementedError(),
            LandingTap.profil => throw UnimplementedError(),
          },
          bottomNavigationBar: BottomNavigationBar(
            items: [
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/home-icon.svg'))
            ],
          ),
        );
      },
    );
  }
}
