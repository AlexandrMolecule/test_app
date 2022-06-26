// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) => DailyWeather(
      dt: (json['dt'] as num).toDouble(),
      temp: Temperature.fromJson(json['temp'] as Map<String, dynamic>),
      humidity: (json['humidity'] as num).toDouble(),
      feelsLike: FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      windSpeed: (json['wind_speed'] as num).toDouble(),
      weatherCondition: (json['weather'] as List<dynamic>)
          .map((e) => WeatherCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyWeatherToJson(DailyWeather instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'weather': instance.weatherCondition,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
    };
