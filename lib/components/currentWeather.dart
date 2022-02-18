import 'package:farm/components/weather.dart';
import 'package:flutter/material.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Weather"),
      ),
    );
  }

  Widget weatherBox(Weather _weather) {
    return Column(
      children: <Widget>[
        Text("${_weather.temp}"),
        Text("${_weather.description}"),
        Text("${_weather.feelsLike}"),
        Text("${_weather.high}, L: ${_weather.low}"),
      ],
    );
  }
}
