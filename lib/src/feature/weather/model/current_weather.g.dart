// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      dt: (json['dt'] as num).toDouble(),
      temp: (json['temp'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
      windSpeed: (json['wind_speed'] as num).toDouble(),
      weatherCondition: (json['weather'] as List<dynamic>)
          .map((e) => WeatherCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'humidity': instance.humidity,
      'feels_like': instance.feelsLike,
      'wind_speed': instance.windSpeed,
      'weather': instance.weatherCondition,
    };
