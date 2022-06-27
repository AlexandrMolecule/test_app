import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

class WeatherImage extends StatelessWidget {
  final String imgSrc;

  const WeatherImage({Key? key, required this.imgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network("http://openweathermap.org/img/wn/$imgSrc@2x.png");
  }
}
