import 'package:flutter/material.dart';
import 'package:test_app/src/app.dart';
import 'package:test_app/src/feature/common/data/network/network_client.dart';
import 'package:test_app/src/feature/weather/data/geoloc_data_provider.dart';
import 'package:test_app/src/feature/weather/data/weather_data_provider.dart';

void main() async {
  const app = App();
  runApp(app);
  // final response = await GeolocationDataProviderImpl(client: NetworkClient())
  //     .searchLocation(queryLocation: "Moscow");
  final response = await WeatherDataProviderImpl(client: NetworkClient())
      .getWeatherForecast(lon: -94.04, lat: 33.44);
  print(response.first.feelsLike.night);
}
