import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/feature/weather/bloc/bloc/weather_bloc.dart';
import 'package:test_app/src/feature/weather/widget/screens/weather_screen.dart';

import '../../data/weather_repository.dart';

class CitySelection extends StatefulWidget {
  const CitySelection({Key? key}) : super(key: key);

  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final TextEditingController _textController = TextEditingController();
  late WeatherBloc _weatherBloc;

  @override
  void initState() {
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('City'),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'City',
                ),
              ),
            ),
            TextButton(
              child: const Text("Accept"),
              onPressed: () {
                // here we add Fetch event after accept clicking
                _weatherBloc.add(FetchWeather(city: _textController.text));
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: _weatherBloc,
                          child: const Weather(),
                        ),
                      ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
