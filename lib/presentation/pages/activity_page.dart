import 'package:agro/presentation/pages/add_new_breed/add_new_breed_page.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
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
                          const SizedBox(height: 40),
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
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              right: 16,
              left: 16,
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const AddNewBreedPage()),
                  );
                },
                child: const Text('Мал чарбасы'),
              ),
            ),
            Positioned(
              bottom: 12,
              right: 16,
              left: 16,
              child: FilledButton(
                onPressed: () {},
                child: const Text('Өсүмдүк өстүрүү'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
