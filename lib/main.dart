import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/app.dart';
import 'package:test_app/src/core/bloc/app_bloc_observer.dart';
import 'package:test_app/src/feature/weather/data/weather_repository.dart';

void main() => runZonedGuarded<void>(
      () async {
        BlocOverrides.runZoned(
          () {
            //usually i use service locator, but there i jsut initialze repository in main :)
            final weatherRepository = WeatherRepositoryImpl();
            final app = App(weatherRepository: weatherRepository);
            runApp(app);
          },
          // here is bloc observer, thanks to him we can add firebase crashlytics and locally log bloc events, errors and more
          blocObserver: AppBlocObserver.instance(),
        );
      },
      (error, stackTrace) {},
    );
