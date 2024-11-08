import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Text(
                    'Багытыңызды тандаңыз',
                    style: typography.h2.bold,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Мал чарбасы',
                    style: typography.h3.bold,
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/cow.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Өсүмдүк өстүрүү',
                    style: typography.h3.bold,
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/farm.jpg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 49),
                  FilledButton(
                    onPressed: () {},
                    child: Text(
                      'Мал чарбасы',
                      style: typography.h3.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () {},
                    child: Text(
                      'Өсүмдүк өстүрүү',
                      style: typography.h3.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
