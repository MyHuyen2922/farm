import 'package:farm/weather/currentWeather.dart';
import 'package:farm/weather/weather_api.dart';
import 'package:flutter/material.dart';
import 'package:farm/weather/weather.dart';

class ShowWeather extends StatefulWidget {
  @override
  State<ShowWeather> createState() => _ShowWeatherState();
}

class _ShowWeatherState extends State<ShowWeather> {
  WeatherApi client = WeatherApi();
  Weather? data;

  Future<void> getData() async {
  data = await client.getCurrentWeather("Bạc Liêu");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(Icons.wb_sunny_rounded, "${data!.temp}", "${data!.cityName}"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Inf",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20,
                )
              ],
            );
          }
          return Container();
        },
      )
    );
  }
}
