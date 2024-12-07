import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/change_diraction/change_diraction_page.dart';
import 'package:agro/presentation/pages/communicate/communicate_page.dart';
import 'package:agro/presentation/pages/landing/bloc/bottom_nav_bloc.dart';
import 'package:agro/presentation/pages/profil/widgets/custom_tile_widget.dart';
import 'package:agro/presentation/pages/profil/widgets/profil_view_widget.dart';
import 'package:agro/presentation/pages/profil/widgets/show_dialog_widget.dart';
import 'package:agro/presentation/pages/profil_data/profil_data_page.dart';

import '../../../common/widgets/customLogo.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Профиль',
                        style: typography.h2.bold,
                      ),
                      InkWell(
                        onTap: () {
                          showDialogWidget(context);
                        },
                        child: SvgPicture.asset('assets/log-out-icon.svg'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      profilViewWidget(context),
                      const SizedBox(height: 26),
                      Container(
                        decoration: BoxDecoration(
                          color: colors.onBackground,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customTileWidget(
                                context,
                                icon: 'assets/human-icon-green.svg',
                                title: 'Профилдин маалыматы',
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfilDataPage(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 12),
                              customTileWidget(
                                context,
                                icon: 'assets/trail-sign-icon.svg',
                                title: 'Багытыңыздын түрүн өзгөртү',
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChangeDiractionPage(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 12),
                              BlocProvider(
                                create: (context) => BottomNavBloc(),
                                child: customTileWidget(
                                  context,
                                  icon: 'assets/bar-chart-icon.svg',
                                  title: 'Насыя алуу үчүн калькулятор',
                                  onTap: () {
                                    BlocProvider.of<BottomNavBloc>(context).add(
                                      const PageTappedEvent(
                                          LandingTap.calculator),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 12),
                              customTileWidget(
                                context,
                                icon: 'assets/add-icon-green.svg',
                                title: 'Жаңы пароданы кошуу',
                                onTap: () {},
                              ),
                              const SizedBox(height: 12),
                              customTileWidget(
                                context,
                                icon: 'assets/chatbubble-ellipses-icon.svg',
                                title: 'Байланышуу',
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CommunicatePage(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              right: 16,
              child: customLogo(),
            ),
          ],
        ),
      ),
    );
  }
}
