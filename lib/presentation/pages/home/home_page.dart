import 'package:agro/presentation/pages/expense_page.dart';
import 'package:agro/presentation/pages/income_page.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final tabss = [
  'Mestnyi',
  'Shved',
  'Голланд',
  'Mestnyi',
  'Shved',
  'Голланд',
  'Mestnyi',
  'Shved',
  'Голланд',
  'Голланд',
];

final date = [
  'Бүгүн',
  'Эртең',
  '18.11',
  '18.11',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Image.asset(
              'assets/farm.jpg',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 16,
              right: 16,
              top: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      Text(
                        date[index],
                        style: typography.p3.bold
                            .copyWith(color: colors.background),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          SvgPicture.asset(index == 0 || index == 1
                              ? 'assets/thunderstorm.svg'
                              : 'assets/sunny.svg'),
                          const SizedBox(width: 4),
                          Column(
                            children: [
                              Text(
                                '+12\'',
                                style: typography.p3.bold
                                    .copyWith(color: colors.background),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '+22\'',
                                style: typography.p3.bold
                                    .copyWith(color: colors.background),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              top: 110,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: colors.secondary2,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'Сүт багытынын рентабелдүүлүгү',
                      style: typography.p1.bold.copyWith(
                        color: colors.background,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '0%',
                      style: typography.h0.bold.copyWith(
                        color: colors.background,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              labelStyle: typography.h1.bold,
              labelColor: colors.primary,
              unselectedLabelColor: Colors.black,
              indicatorColor: colors.primary,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Cүт'),
                Tab(text: 'Эт'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: DefaultTabController(
            initialIndex: 0,
            length: 10,
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ButtonsTabBar(
                      width: MediaQuery.sizeOf(context).width / 3.2,
                      contentCenter: true,
                      buttonMargin: const EdgeInsets.only(right: 5),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      backgroundColor: colors.primary,
                      unselectedBackgroundColor: colors.onBackground,
                      unselectedLabelStyle:
                          typography.p1.bold.copyWith(color: Colors.black),
                      labelStyle:
                          typography.p1.bold.copyWith(color: colors.background),
                      tabs: List.generate(10, (index) {
                        return Tab(
                          text: tabss[index],
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: TabBarView(
                    children: [
                      _tabBarViewWidget(context),
                      Center(child: Text('Shved')),
                      Center(child: Text('Голланд')),
                      Center(child: Text('Mestnyi')),
                      Center(child: Text('Shved')),
                      Center(child: Text('Голланд')),
                      Center(child: Text('Mestnyi')),
                      Center(child: Text('Shved')),
                      Center(child: Text('Голланд')),
                      Center(child: Text('Голланд')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _tabBarViewWidget(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              height: 84,
              decoration: BoxDecoration(
                color: colors.onBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Чыгаша: 0'),
                        Text('Киреше: 0'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text('Түшүмдүүлүгү: 0%'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Кошумча чыгаша кошуу',
                    style: typography.p1.bold,
                  ),
                  InkWell(
                    overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    splashColor: colors.onBackground,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ExpensePage(),
                      ));
                    },
                    child: Image.asset('assets/add_icon.png'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Жаңы киреше кошуу',
                    style: typography.p1.bold,
                  ),
                  InkWell(
                    overlayColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                    splashColor: colors.onBackground,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const IncomePage(),
                      ));
                    },
                    child: Image.asset('assets/add_icon.png'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Column(
              children: List.generate(14, (index) {
                if (index == 0 || index % 4 == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SizedBox(
                      height: 28,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'До беременности',
                            style: typography.p1.bold.copyWith(
                              color: colors.primary,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                color: colors.onBackground,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: colors.secondary1),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: SizedBox(
                    height: 28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Новый корм', style: typography.p1.bold),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              color: colors.onBackground,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: colors.secondary1),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
