import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/src/feature/weather/model/weather_condition.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  final double dt, temp, humidity;
  @JsonKey(name: "feels_like")
  final double feelsLike;
  @JsonKey(name: "wind_speed")
  final double windSpeed;
  @JsonKey(name: "weather")
  final List<WeatherCondition> weatherCondition;

  CurrentWeather(
      {required this.dt,
      required this.temp,
      required this.humidity,
      required this.feelsLike,
      required this.windSpeed, required this.weatherCondition});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}
