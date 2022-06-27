import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:test_app/src/feature/common/utils/timestamp_helper.dart';

import '../../model/weather.dart';

class ForecastScreen extends StatelessWidget {
  final Weather weather;
  const ForecastScreen({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forecast = weather.dailyForecast;
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            itemBuilder: ((context, i) {
              final dayForecast = forecast[i];
              return ListTile(
                // it's bad, i know
                leading: Image.network(
                    "http://openweathermap.org/img/wn/${dayForecast.weatherCondition.first.icon}@2x.png"),
                title: Text("${dayForecast.temp.morn.round().toString()} °C"),
                subtitle: Text(dayForecast.dt.dateFromTimeStamp()),
              );
            }),
            separatorBuilder: (context, i) => const Divider(),
            itemCount: forecast.length));
  }
}
