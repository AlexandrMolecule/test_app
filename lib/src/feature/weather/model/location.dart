import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final String name;
  final String? country, state;
  @JsonKey(name: "lat")
  final double latitude;
  @JsonKey(name: "lon")
  final double longitude;

  Location(
      {required this.name,
      required this.latitude,
      required this.longitude,
      this.country,
      this.state});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
