import 'package:test_app/src/core/configuration/configuration.dart';
import 'package:test_app/src/feature/common/data/network/network_client.dart';
import 'package:test_app/src/feature/weather/model/current_weather.dart';
import 'package:test_app/src/feature/weather/model/daily_weather.dart';

import '../model/location.dart';
import '../model/weather.dart';

abstract class IWeatherDataProvider {
  // get current weather with forecast by latitude, longitude
  Future<Weather> getWeather({required double lat, required double lon});
}

class WeatherDataProviderImpl implements IWeatherDataProvider {
  final NetworkClient _client;
  const WeatherDataProviderImpl({required final client}) : _client = client;

  // i decided use one general model for forecast and current weather
  @override
  Future<Weather> getWeather({required double lat, required double lon}) async {
    Weather parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = Weather.fromJson(jsonMap);
      return response;
    }

    final response =
        await _client.get(Configuration.weatherPath, parser, <String, dynamic>{
      "lat": lat.toString(),
      "lon": lon.toString(),
      "appid": Configuration.apiKey,
      "exclude": "hourly,minutely,alerts",
      "units": "metric"
    });
    return response;
  }
}
