import 'package:agro/presentation/pages/weather/widgets/build_days.dart';
import 'package:agro/presentation/pages/weather/widgets/build_month_title.dart';
import 'package:agro/presentation/uikit/customAppBarWithBack.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppBarWithBack(context, title: '30 күндүк аба ырайы'),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  buildMonthTitle(context, month: 'Ноябрь'),
                  buildDays(context, weatherIcon: 'assets/sunny_grey.svg'),
                  buildMonthTitle(context, month: 'Декабрь'),
                  buildDays(context,
                      weatherIcon: 'assets/thunderstorm_grey.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
