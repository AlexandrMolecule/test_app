import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/src/feature/weather/model/feels_like.dart';
import 'package:test_app/src/feature/weather/model/temperature.dart';
import 'package:test_app/src/feature/weather/model/weather_condition.dart';

part 'daily_weather.g.dart';

@JsonSerializable()
class DailyWeather {
  final double dt, humidity;

  @JsonKey(name: "wind_speed")
  final double windSpeed;
  @JsonKey(name: "weather")
  final List<WeatherCondition> weatherCondition;

  final Temperature temp;

  @JsonKey(name: "feels_like")
  final FeelsLike feelsLike;


  DailyWeather(
      {required this.dt,
      required this.temp,
      required this.humidity,
      required this.feelsLike,
      required this.windSpeed,
      required this.weatherCondition});

  factory DailyWeather.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);
}
