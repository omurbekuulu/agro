import 'package:agro/presentation/pages/landing/landing_page.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:agro/presentation/uikit/customAppBarWithBack.dart';
import 'package:agro/presentation/uikit/customLogo.dart';
import 'package:flutter/material.dart';

class AddNewBreedPage extends StatefulWidget {
  const AddNewBreedPage({super.key});

  @override
  State<AddNewBreedPage> createState() => _AddNewBreedPageState();
}

class _AddNewBreedPageState extends State<AddNewBreedPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customAppBarWithBack(
                        context,
                        title: 'Жаңы парода кошуу',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 24),
                              const Text('Уйдун пародасы'),
                              const SizedBox(height: 4),
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colors.onBackground,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Пароданы тандаңыз',
                                        style: TextStyle(
                                            color: colors.onBackground2),
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text('Уйдун жашы'),
                              const SizedBox(height: 4),
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colors.onBackground,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Мезгилди тандаңыз',
                                        style: TextStyle(
                                            color: colors.onBackground2),
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text('Уйдун саны'),
                              const SizedBox(height: 4),
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colors.onBackground,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                            color: colors.onBackground2),
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 125),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 74,
              right: 16,
              child: customLogo(),
            ),
            Positioned(
              bottom: 12,
              left: 16,
              right: 16,
              child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const LandingPage()),
                    );
                  },
                  child: const Text('Кошуу')),
            ),
          ],
        ),
      ),
    );
  }
}