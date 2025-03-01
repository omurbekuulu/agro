import 'dart:convert';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Weather {
  final String areaName;
  final List<Forecast> forecastList;

  Weather({required this.areaName, required this.forecastList});

  factory Weather.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    List<Forecast> forecastList =
        list.map((item) => Forecast.fromJson(item)).toList();

    return Weather(
      areaName: json['city']['name'],
      forecastList: forecastList,
    );
  }
}

class Forecast {
  final DateTime date;
  final double tempMin;
  final double tempMax;

  Forecast({required this.date, required this.tempMin, required this.tempMax});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.parse(json['dt_txt']),
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
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
        // Получаем месяц из первого прогноза, чтобы он был отображён сверху
        if (_weather?.forecastList.isNotEmpty ?? false) {
          _monthName =
              DateFormat('MMMM').format(_weather!.forecastList[0].date);
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
    if (_weather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8),  
      child: CustomScrollView(
        slivers: [
          _locationHeader(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 29),
                  Text(
                    _monthName ?? '...',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          buildDays(context, weatherIcon: 'assets/sunny_grey.svg')
        ],
      ),
    );
  }

  Widget _locationHeader() {
    return SliverToBoxAdapter(
      child: Text(
        _weather?.areaName ?? 'loading name...',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildDays(BuildContext context, {required String weatherIcon}) {
    final typography = Theme.of(context).appTypography;
    final mediaQueryWidth = MediaQuery.sizeOf(context).width;

    DateFormat dateFormat = DateFormat('dd.MM');

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: mediaQueryWidth >= 450 ? 5 : 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 7.5,
        childAspectRatio: mediaQueryWidth >= 450 ? 0.7 : 1.3,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final forecast = _weather?.forecastList[index];

          if (forecast == null) return Container();

          String dayMonth = dateFormat.format(forecast.date);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(dayMonth, style: typography.p3.bold),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(weatherIcon),
                  const SizedBox(width: 4),
                  Column(
                    children: [
                      Text('${forecast.tempMin.toStringAsFixed(1)}°C',
                          style: typography.p3.bold),
                      const SizedBox(height: 6),
                      Text('${forecast.tempMax.toStringAsFixed(1)}°C',
                          style: typography.p3.bold),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
        childCount: _weather?.forecastList.length ?? 0,
      ),
    );
  }
}
