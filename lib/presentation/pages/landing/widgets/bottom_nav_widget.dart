import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/landing/bloc/bottom_nav_bloc.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Container(
      decoration: BoxDecoration(
        color: colors.background,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(40, 24, 39, 75),
            spreadRadius: -4,
            blurRadius: 88,
            offset: Offset(0, 18),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 21, right: 21, bottom: 12, top: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildNavItem(context, 'assets/home-icon.svg',
                'assets/home-icon-green.svg', LandingTap.home),
            buildNavItem(context, 'assets/statistics-icon.svg',
                'assets/statistics-icon-green.svg', LandingTap.statistics),
            buildNavItem(context, 'assets/calculator-icon.svg',
                'assets/calculator-icon-green.svg', LandingTap.calculator),
            buildNavItem(context, 'assets/notification-icon.svg',
                'assets/notification-icon-green.svg', LandingTap.notification),
            buildNavItem(context, 'assets/profil-icon.svg',
                'assets/profil-icon-green.svg', LandingTap.profil),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem(
    BuildContext context,
    String icon,
    String selectedIcon,
    LandingTap tab,
  ) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        final currentIcon = state.tab == tab ? selectedIcon : icon;

        return BlocProvider(
          create: (context) => BottomNavBloc(),
          child: InkWell(
            child: SvgPicture.asset(currentIcon),
            onTap: () {
              BlocProvider.of<BottomNavBloc>(context).add(PageTappedEvent(tab));
            },
          ),
        );
      },
    );
  }
}
