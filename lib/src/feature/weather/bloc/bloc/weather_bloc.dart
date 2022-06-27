import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:test_app/src/feature/weather/data/weather_repository.dart';

import '../../model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is FetchWeather) {
        await onWeatherFetchEvent(event, emit);
      }
    });
  }

  // Single event for fetching new city weather
  Future<void> onWeatherFetchEvent(
    FetchWeather event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(WeatherIsFetching());
      var result =
          await weatherRepository.setNewCityAndGetWeather(city: event.city);

      // we're sorting forecast because of requirements
      result.dailyForecast
          .sort(((a, b) => a.temp.morn.round().compareTo(b.temp.morn.round())));
      emit(WeatherSucces(result, event.city));
    } catch (e) {
      emit(WeatherError(e));
    }
  }
}
