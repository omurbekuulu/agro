part of 'bottom_nav_bloc.dart';

@immutable
class BottomNavState {
  const BottomNavState({
    this.tab = LandingTap.home,
  });

  final LandingTap tab;
}

enum LandingTap { home, statistics, calculator, notification, profil }
