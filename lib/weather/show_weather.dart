import 'dart:developer';

import 'package:farm/weather/currentWeather.dart';
import 'package:farm/weather/weather_api.dart';
import 'package:flutter/material.dart';
import 'package:farm/weather/weather.dart';
import 'dart:convert';
import 'package:date_format/date_format.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ShowWeather extends StatefulWidget {
  @override
  State<ShowWeather> createState() => _ShowWeatherState();
}

class _ShowWeatherState extends State<ShowWeather> {
  WeatherApi client = WeatherApi();
  var data, temp, hum, temp_min, temp_max, wind_speed, day;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => getCurrentWeather());
  }

  void getCurrentWeather() async {
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
    var temp = [];
    for (int i = 0; i < 3; i++) {
      temp.add(body3['daily'][i]);
    }
    body3['daily'] = temp;
    setState(() {
      data = body3;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(new DateTime.fromMicrosecondsSinceEpoch(data['dt'] * 1000000));
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Dự báo thời Tiết")),
        ),
        body: data == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(
                    children: [
                      ...data['daily'].map((record) {
                        return Container(
                          margin: EdgeInsets.all(7),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber[50],
                            boxShadow: [
                              BoxShadow(color: Colors.green, spreadRadius: 3),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin:EdgeInsets.fromLTRB(1, 1, 1, 10),
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.deepPurple[700],

                                  ),
                                  child: Center(
                                    child: Text(
                                      "${DateFormat('dd-MM-yyyy').format(new DateTime.fromMicrosecondsSinceEpoch(record['dt'] * 1000000))}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  )),
                              Center(
                                child: Icon(
                                  Icons.wb_sunny_rounded,
                                  color: Colors.orange,
                                  size: 60,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                  child: Text(
                                "${record['temp']['day']} °C",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                  child: Text(
                                "${record['weather'][0]['description']}",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey),
                              )),
                              Divider(),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Text(
                                  "Thông tin bổ sung",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.grey),
                                ),
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "T_min",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blueGrey),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "T_max",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${record['temp']['min']} °C",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.blueGrey),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${record['temp']['max']} °C",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tốc độ gió",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blueGrey),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Độ ẩm",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${record['wind_speed']} km/h",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.blueGrey),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${record['humidity']}%",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ));
  }
}
