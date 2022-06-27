import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/feature/weather/widget/screens/weather_screen.dart';

import 'feature/weather/bloc/bloc/weather_bloc.dart';
import 'feature/weather/data/weather_repository.dart';
import 'feature/weather/widget/screens/city_selection_screen.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.weatherRepository}) : super(key: key);
  final IWeatherRepository weatherRepository;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Weather',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home:
            // insert WeatherBloc in Tree
            BlocProvider(
          create: (context) =>
              WeatherBloc(weatherRepository: weatherRepository),
              
          // check, does user already have a city in SharedPref
          child: FutureBuilder<String?>(
              future: weatherRepository.haveCity,
              builder: (context, snapshot) {
                //if user has: go to Weather screen
                if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                  return Weather(
                    city: snapshot.data,
                  );
                  // else user have to input his city
                } else {
                  return const CitySelection();
                }
              }),
        ));
  }
}
