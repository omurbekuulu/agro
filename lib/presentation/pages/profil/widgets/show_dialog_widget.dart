import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/auth/pages/sign_in_page.dart';

Future showDialogWidget(BuildContext context) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: colors.background,
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Аккаунттан чыгуу',
              style: typography.h2.semiBold,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Flexible(
                  child: FilledButton(
                    onPressed: () {
                      AppNavigator.pushAndRemove(
                        context,
                        SignInPage(),
                      );
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFF181818))),
                    child: const Text('Чыгуу'),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Артка'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
