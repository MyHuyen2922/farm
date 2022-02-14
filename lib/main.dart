//import 'package:farm/components/call_API.dart';
//import 'package:farm/components/customdata.dart';
import 'package:farm/components/login.dart';
import 'package:farm/components/navdrawer.dart';
//import 'package:farm/components/seatek.dart';
import 'package:farm/components/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farm/components/getData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
        initialRoute: '/navdrawer',
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
          '/navdrawer': (context) => NavDrawer(),
          '/getdata': (context) => GetData(),
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
