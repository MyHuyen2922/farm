import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:farm/weather/weather.dart';

class WeatherApi {
  getCurrentWeather() async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?appid=8b7da4ef5e218c20e61bb62a4c46e45f&lat=10.02905&lon=105.76253&units=metric&exclude=minutely,hourly");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    var body1 = jsonDecode(response.body.toString());
    //print(body1['daily'][0]['temp']['day']);
    return body1;
  }
}