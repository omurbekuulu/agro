import 'package:agro/presentation/pages/calculator/calculator_page.dart';
import 'package:agro/presentation/pages/change_diraction/change_diraction_page.dart';
import 'package:agro/presentation/pages/communicate/communicate_page.dart';
import 'package:agro/presentation/pages/profil/widgets/custom_tile_widget.dart';
import 'package:agro/presentation/pages/profil/widgets/profil_view_widget.dart';
import 'package:agro/presentation/pages/profil/widgets/show_dialog_widget.dart';
import 'package:agro/presentation/pages/profil_data/profil_data_page.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                              builder: (context) => const ProfilDataPage(),
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
                              builder: (context) => const ChangeDiractionPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      customTileWidget(
                        context,
                        icon: 'assets/bar-chart-icon.svg',
                        title: 'Насыя алуу үчүн калькулятор',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CalculatorPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      customTileWidget(
                        context,
                        icon: 'assets/add-icon-green.svg',
                        title: 'Жаңы пароданы кошуу',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ProfilPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      customTileWidget(
                        context,
                        icon: 'assets/chatbubble-ellipses-icon.svg',
                        title: 'Байланышуу',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CommunicatePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/logo.svg',
                    width: 57,
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
