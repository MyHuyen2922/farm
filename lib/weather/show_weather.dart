import 'package:farm/weather/currentWeather.dart';
import 'package:farm/weather/weather_api.dart';
import 'package:flutter/material.dart';
import 'package:farm/weather/weather.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ShowWeather extends StatefulWidget {
  @override
  State<ShowWeather> createState() => _ShowWeatherState();
}

class _ShowWeatherState extends State<ShowWeather> {
  WeatherApi client = WeatherApi();
  var data;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => getCurrentWeather());
  }

  void getCurrentWeather() async {
    print("1");
    var endpoint1 = Uri.parse(
        "https://api.opencagedata.com/geocode/v1/json?language=vi&countrycode=vn&limit=1&no_annotations=1&key=50c04b387edd4fbf869af5e69d19a8c3&q=515 30/4 phường Hưng Lợi, quận Ninh Kiều, Cần Thơ");

    var response1 = await http.get(endpoint1);
    var body1 = jsonDecode(response1.body);
    var body2 = jsonDecode(response1.body.toString());
    var lat = body2['results'][0]['geometry']['lat'];
    var lng = body2['results'][0]['geometry']['lng'];
    var endpoint2 = Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?appid=8b7da4ef5e218c20e61bb62a4c46e45f&lat=$lat&lon=$lng&units=metric&exclude=minutely,hourly");

    var response2 = await http.get(endpoint2);
    var body3 = jsonDecode(response2.body.toString());
    //print(body1['daily'][0]['temp']['day']);
    setState(() {
      data = body3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather"),
        ),
        body: Text(data['daily'][0]['temp']['day'].toString())
    );
  }
}