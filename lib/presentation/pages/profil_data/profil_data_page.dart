import 'package:agro/presentation/theme/theme.dart';
import 'package:agro/presentation/uikit/customAppBarWithBack.dart';
import 'package:agro/presentation/uikit/customTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilDataPage extends StatefulWidget {
  const ProfilDataPage({super.key});

  @override
  State<ProfilDataPage> createState() => _ProfilDataPageState();
}

class _ProfilDataPageState extends State<ProfilDataPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customAppBarWithBack(context, title: 'Профилдин маалыматы'),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 31),
                      Text(
                        'Аты жөнү:',
                        style: TextStyle(color: colors.secondary1),
                      ),
                      const SizedBox(height: 4),
                      customTextFormField(
                        context,
                        inputType: TextInputType.text,
                        hintText: 'Иванов Иван',
                        hasValue: true,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Телефон:',
                        style: TextStyle(color: colors.secondary1),
                      ),
                      const SizedBox(height: 4),
                      customTextFormField(
                        context,
                        inputType: TextInputType.text,
                        hintText: '0505 00 12 45',
                        hasValue: true,
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
              FilledButton(
                onPressed: () {},
                child: const Text('Кошуу'),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
