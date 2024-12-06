import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter/material.dart';

Future showDialogWidget(BuildContext context) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;
  TextEditingController controller = TextEditingController(text: '0');

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Кошуу',
            style: typography.h3.bold.copyWith(color: colors.background),
          ),
        )
      ],
      title: Text(
        'Сумма',
        style: typography.h3.bold,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colors.secondary1),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.secondary1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.secondary1),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Канча сом кеткенин жазыңыз',
            style: typography.p2.medium.copyWith(color: colors.onBackground2),
          ),
          const SizedBox(height: 4),
          Text(
            'Эгер 0 с болсо жөн эле кошууну басыңыз',
            style: typography.p2.medium.copyWith(color: colors.onBackground2),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}
