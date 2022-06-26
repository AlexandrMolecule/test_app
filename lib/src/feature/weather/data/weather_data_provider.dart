import 'package:test_app/src/core/configuration/configuration.dart';
import 'package:test_app/src/feature/common/data/network/network_client.dart';
import 'package:test_app/src/feature/weather/model/current_weather.dart';
import 'package:test_app/src/feature/weather/model/daily_weather.dart';

import '../model/location.dart';

abstract class IWeatherDataProvider {
  // get current weather w/o forecast by latitude, longitude
  Future<CurrentWeather> getCurrentWeather(
      {required double lat, required double lon});

  // get forecast without current weather state by latitude, longitude
  Future<List<DailyWeather>> getWeatherForecast(
      {required double lat, required double lon});
}

class WeatherDataProviderImpl implements IWeatherDataProvider {
  final NetworkClient _client;
  const WeatherDataProviderImpl({required final client}) : _client = client;

  @override
  Future<CurrentWeather> getCurrentWeather(
      {required double lat, required double lon}) {
    CurrentWeather parser(dynamic json) {
      final jsonMap = json["current"] as Map<String, dynamic>;
      final response = CurrentWeather.fromJson(jsonMap);
      return response;
    }

    final response =
        _client.get(Configuration.weatherPath, parser, <String, dynamic>{
      "lat": lat.toString(),
      "lon": lon.toString(),
      "appid": Configuration.apiKey,
      "exclude": "hourly,minutely,alerts,daily",
      "units": "metric"
    });
    return response;
  }

  @override
  Future<List<DailyWeather>> getWeatherForecast(
      {required double lat, required double lon}) {
    List<DailyWeather> parser(dynamic json) {
      final jsonList = json["daily"] as List;
      final response = jsonList.map((e) => DailyWeather.fromJson(e)).toList();
      return response;
    }

    final response =
        _client.get(Configuration.weatherPath, parser, <String, dynamic>{
      "lat": lat.toString(),
      "lon": lon.toString(),
      "appid": Configuration.apiKey,
      "exclude": "hourly,minutely,alerts,current",
      "units": "metric"
    });
    return response;
  }
}
