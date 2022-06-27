import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/feature/weather/data/weather_repository.dart';
import 'package:test_app/src/feature/weather/widget/location.dart';
import 'package:test_app/src/feature/weather/widget/screens/forecast_screen.dart';
import 'package:test_app/src/feature/weather/widget/weather_temperature.dart';

import '../../bloc/bloc/weather_bloc.dart';
import 'city_selection_screen.dart';

class Weather extends StatefulWidget {
  final String? city;

  const Weather({Key? key, this.city}) : super(key: key);
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    //we find bloc in context
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    // if we have city add Fetch Event
    final city = widget.city;
    if (city != null) {
      _weatherBloc.add(FetchWeather(city: city));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text("Weather"),
        backgroundColor: Colors.pink,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: _weatherBloc,
                    child: const CitySelection(),
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              if (_weatherBloc.state is WeatherSucces) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForecastScreen(
                      weather: (_weatherBloc.state as WeatherSucces).weather,
                    ),
                  ),
                );
              }
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        // i chosen blocConsumer, because i need to show snackbar in response to error state
        child: BlocConsumer(
          listener: ((context, state) {
            if (state is WeatherError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("${state.error}"),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.8,
                ),
              ));
            }
          }),
          bloc: _weatherBloc,
          builder: (_, WeatherState state) {
            //there shouldn't be such a case
            if (state is WeatherEmpty) {
              return const Center(
                  child: Text('Please enter a location',
                      style: TextStyle(color: Colors.white)));
            }
            // fetching state
            if (state is WeatherIsFetching) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              );
            }
            // succes loaded weather
            if (state is WeatherSucces) {
              final weather = state.weather;
              return ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Center(
                      child: Location(location: state.city),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: WeatherTemperature(
                        weather: weather,
                      ),
                    ),
                  ),
                ],
              );
            }

            // we show error in error case
            if (state is WeatherError) {
              return const Text(
                'Fetching data error',
                style: TextStyle(color: Colors.red, fontSize: 28),
              );
            } else {
              return const Text(
                'Choose your city, please',
                style: TextStyle(color: Colors.white),
              );
            }
          },
        ),
      ),
    );
  }
}
