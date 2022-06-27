import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/src/feature/common/data/network/network_client.dart';
import 'package:test_app/src/feature/weather/data/weather_data_provider.dart';

import '../model/weather.dart';
import 'geoloc_data_provider.dart';

abstract class IWeatherRepository {
  // we write new city and retrieve current weather status with forecast
  Future<Weather> setNewCityAndGetWeather({required String city});

  // Gives us know, whether we have city
  Future<String?> get haveCity;
}

class WeatherRepositoryImpl implements IWeatherRepository {
  WeatherRepositoryImpl({
    final IGeolocationDataProvider? geolocationDataProvider,
    final IWeatherDataProvider? weatherDataProvider,
  })  : _geolocationDataProvider = geolocationDataProvider ??
            GeolocationDataProviderImpl(client: NetworkClient()),
        _weatherDataProvider = weatherDataProvider ??
            WeatherDataProviderImpl(client: NetworkClient());

  final IGeolocationDataProvider _geolocationDataProvider;
  final IWeatherDataProvider _weatherDataProvider;

  @override
  Future<String?> get haveCity async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_Keys.cityKey);
  }

  @override
  Future<Weather> setNewCityAndGetWeather({required String city}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_Keys.cityKey, city);
    final location =
        await _geolocationDataProvider.searchLocation(queryLocation: city);
    final weather = await _weatherDataProvider.getWeather(
        lat: location.latitude, lon: location.longitude);
    return weather;
  }
}

abstract class _Keys {
  static const cityKey = "current_city";
}
