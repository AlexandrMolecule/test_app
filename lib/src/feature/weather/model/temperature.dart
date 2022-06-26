import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()
class Temperature {
  final double day, min, max, night, eve, morn;

  Temperature({required this.day, required this.min, required this.max, required this.night, required this.eve, required this.morn});


  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);


  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
