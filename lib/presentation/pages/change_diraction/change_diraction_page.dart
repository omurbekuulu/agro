import 'package:agro/common/widgets/customAppBarWithBack.dart';
import 'package:agro/common/widgets/customLogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:agro/core/configs/theme/theme.dart';

class ChangeDiractionPage extends StatelessWidget {
  const ChangeDiractionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBarWithBack(context,
                    title: 'Багытыңыздын түрүн өзгөртү'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      const Text('Багытыңыздын азыркы түрү'),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(colors.secondary1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Мал чарбасы'),
                            SvgPicture.asset('assets/radio-button-icon.svg'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Жаңы түрү'),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(colors.onBackground),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Мал чарбасы',
                              style: TextStyle(color: Colors.black),
                            ),
                            Image.asset('assets/add-icon.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
