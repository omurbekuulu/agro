part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {
  const BottomNavEvent();
}

final class PageTappedEvent extends BottomNavEvent {
  const PageTappedEvent(this.tap);

  final LandingTap tap;
}