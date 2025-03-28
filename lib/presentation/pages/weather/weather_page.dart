import 'dart:convert';
import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

//TODO: it`ll impelement with clean arhitechture

class Weather {
  final String areaName;
  final Map<String, Forecast> forecastMap;

  Weather({required this.areaName, required this.forecastMap});

  factory Weather.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    Map<String, Forecast> forecastMap = {};

    // Группируем прогнозы по дням
    for (var item in list) {
      Forecast forecast = Forecast.fromJson(item);
      String dateKey = DateFormat('yyyy-MM-dd')
          .format(forecast.date); // Форматируем дату для ключа

      if (!forecastMap.containsKey(dateKey)) {
        forecastMap[dateKey] =
            forecast; // Сохраняем первый прогноз для каждого дня
      }
    }

    return Weather(
      areaName: json['city']['name'],
      forecastMap: forecastMap,
    );
  }
}

class Forecast {
  final DateTime date;
  final dynamic tempMin;
  final dynamic tempMax;
  final String icon;

  Forecast({
    required this.date,
    required this.tempMin,
    required this.tempMax,
    required this.icon,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.parse(json['dt_txt']),
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      icon: json['weather'][0]['icon'],
    );
  }
}

Future<Weather> getWeather() async {
  const baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';
  const apikey = 'c2bf0c4ec4d16685c8a56a3f56650ee6';

  const url = '$baseUrl?lat=44.34&lon=10.99&appid=$apikey&units=metric';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load weather data');
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather? _weather;
  String? _monthName;

  fetchData() async {
    try {
      final weather = await getWeather();

      setState(() {
        _weather = weather;
        if (_weather?.forecastMap.isNotEmpty ?? false) {
          _monthName = DateFormat('MMMM', 'ru_RU')
              .format(_weather!.forecastMap.values.first.date);

          // Делаем первую букву заглавной
          _monthName = _monthName?.replaceFirst(
              _monthName![0], _monthName![0].toUpperCase());
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildUi(),
    );
  }

  Widget buildUi() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 29.h),
                    Text(
                      _monthName ?? '...',
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            buildDays(context),
            SliverToBoxAdapter(
              child: 24.verticalSpace,
            )
          ],
        ),
      ),
    );
  }

  Widget buildDays(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final colors = Theme.of(context).appColors;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ScreenUtil().screenWidth >= 450.w ? 5 : 4,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
        childAspectRatio: ScreenUtil().screenWidth >= 450.w ? 0.7 : 1.2,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          List<String> uniqueDates = _weather?.forecastMap.keys.toList() ?? [];
          String dateKey = uniqueDates[index];
          Forecast forecast = _weather!.forecastMap[dateKey]!;

          var dayInfo = getDayLabel(forecast.date);
          String dayLabel = dayInfo['label'];
          bool isToday = dayInfo['isToday'];

          return Container(
            decoration: isToday
                ? BoxDecoration(
                    color: colors.secondary1,
                    borderRadius: BorderRadius.circular(12.r))
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 3.h),
                Text(
                  dayLabel,
                  style: isToday
                      ? typography.p3.bold.copyWith(color: colors.background)
                      : typography.p3.bold,
                ),
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.network(
                        'https://openweathermap.org/img/wn/${forecast.icon}@2x.png',
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Column(
                      children: [
                        Text(
                          '${forecast.tempMin.toStringAsFixed(1)}°C',
                          style: isToday
                              ? typography.p3.bold
                                  .copyWith(color: colors.background)
                              : typography.p3.bold,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '${forecast.tempMax.toStringAsFixed(1)}°C',
                          style: isToday
                              ? typography.p3.bold
                                  .copyWith(color: colors.background)
                              : typography.p3.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        childCount: _weather?.forecastMap.length ?? 0,
      ),
    );
  }
}

Map<String, dynamic> getDayLabel(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = today.add(const Duration(days: 1));

  if (date.year == today.year &&
      date.month == today.month &&
      date.day == today.day) {
    return {"label": "Бүгүн", "isToday": true};
  } else if (date.year == tomorrow.year &&
      date.month == tomorrow.month &&
      date.day == tomorrow.day) {
    return {"label": "Эртең", "isToday": false};
  } else {
    return {"label": DateFormat('dd.MM').format(date), "isToday": false};
  }
}
