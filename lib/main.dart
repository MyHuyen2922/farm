import 'package:farm/components/real_para.dart';
import 'package:farm/components/login.dart';
import 'package:farm/components/navdrawer.dart';
import 'package:farm/components/signup.dart';
import 'package:farm/components/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farm/components/getData.dart';
import 'package:farm/components/call_API_local.dart';
import 'package:farm/weather/show_weather.dart';
import 'package:farm/components/call_API.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
        initialRoute: '/navdrawer',
        debugShowCheckedModeBanner: false,
        routes: {
          '/show_weather': (context) => ShowWeather(),
          '/call_api_local': (context) => CallAPILocal(),
          '/call_api': (context) => CallAPI(),
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
          '/navdrawer': (context) => NavDrawer(),
          '/getdata': (context) => GetData(),
          '/real_para': (context) => RealParameters(),
          '/test': (context) => DeleteWidget(),
        }),
  );
}

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
    );
  }
}*/
