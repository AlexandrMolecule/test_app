import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/src/feature/weather/model/current_weather.dart';
import 'package:test_app/src/feature/weather/model/daily_weather.dart';
import 'package:test_app/src/feature/weather/model/weather_condition.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final double lat, lon;

  final CurrentWeather current;
  @JsonKey(name: "daily")
  final List<DailyWeather> dailyForecast;
  Weather(
    this.lat,
    this.lon,
    this.current,
    this.dailyForecast,
  );

  Weather copyWith({List<DailyWeather>? dailyForecast}) {
    return Weather(lat, lon, current, dailyForecast ?? this.dailyForecast);
  }

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
