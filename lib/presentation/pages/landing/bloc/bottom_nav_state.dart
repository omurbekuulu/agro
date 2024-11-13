part of 'bottom_nav_bloc.dart';

@immutable
class BottomNavState {
  const BottomNavState({
    this.tap = LandingTap.home,
  });

  final LandingTap tap;
}

enum LandingTap { home, statistics, calculator, notification, profil }
