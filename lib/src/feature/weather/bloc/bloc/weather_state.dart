part of 'weather_bloc.dart';

class WeatherState {}

class WeatherInitial extends WeatherState {
  @override
  bool operator ==(Object other) =>
      other is WeatherInitial && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

// fetching in progrss
class WeatherIsFetching extends WeatherState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherIsFetching && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

// weather is succesfully loaded
class WeatherSucces extends WeatherState {
  final Weather weather;
  final String city;

  WeatherSucces(this.weather, this.city);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherSucces && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class WeatherError extends WeatherState {
  final Object error;

  WeatherError(this.error);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherError &&
          runtimeType == other.runtimeType &&
          error == other.error;

  @override
  int get hashCode => error.hashCode;
}

class WeatherEmpty extends WeatherState {
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherEmpty && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
