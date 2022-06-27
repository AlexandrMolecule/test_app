import 'package:flutter/material.dart';
import 'package:test_app/src/feature/weather/widget/temperature.dart';
import 'package:test_app/src/feature/weather/widget/weather_image.dart';


import '../model/weather.dart';

class WeatherTemperature extends StatelessWidget {
  final Weather weather;

  const WeatherTemperature({
    Key? key,
    required this.weather,
  })  : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeatherImage(imgSrc: weather.current.weatherCondition.first.icon),
            ),
            Padding(
              padding:const EdgeInsets.all(20.0),
              child:  Temperature(
                temperature: weather.current.temp,
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            weather.current.weatherCondition.first.main,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20,),
        // Влажность
        Text("Humidity: ${weather.current.humidity.round()}",
        style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w200,
              color: Colors.white70,
            ),
        ),
        // Скорость ветра
        Text("Wind Speed: ${weather.current.windSpeed.round()}",
        style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w200,
              color: Colors.white70,
            ),
        ),
      ],
    );
  }
}