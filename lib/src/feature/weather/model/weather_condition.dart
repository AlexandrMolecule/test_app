import 'package:json_annotation/json_annotation.dart';

part 'weather_condition.g.dart';

@JsonSerializable()
class WeatherCondition {
  final int id;
  final String main, description, icon;

  WeatherCondition(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);
}
