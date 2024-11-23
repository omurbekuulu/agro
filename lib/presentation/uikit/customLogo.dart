import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget customLogo() {
  return Column(
    children: [
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
  );
}
