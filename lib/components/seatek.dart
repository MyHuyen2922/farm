import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Seatek extends StatefulWidget {
  @override
  State<Seatek> createState() => _SeatekState();
}

class _SeatekState extends State<Seatek> {
  Future getUserData() async {
    http.post(
        Uri.parse('http://14.252.65.144:8080/ajax/remote_device'),
        body: {
          "id_device": '9',
          "start_byte": '63',
          "bit": '4',
          "data_type": 'bool'
        });
  }

  Future getOff() async {
    http.post(
        Uri.parse('http://14.252.65.144:8080/ajax/remote_device'),
        body: {
          "id_device": '9',
          "start_byte": '63',
          "bit": '5',
          "data_type": 'bool'
        });
  }

  Future getOnFan() async {
    http.post(
        Uri.parse('http://14.252.65.144:8080//ajax/remote_device'),
        body: {
          "id_device": '9',
          "start_byte": '12',
          "bit": '2',
          "data_type": 'bool'
        });
  }

  Future getOffFan() async {
    http.post(
        Uri.parse('http://14.252.65.144:8080/ajax/remote_device'),
        body: {
          "id_device": '9',
          "start_byte": '12',
          "bit": '3',
          "data_type": 'bool'
        });
  }
  var number = 0;

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => getData());
  }
  void getData() async {
    var res = http.post(
        Uri.parse('http://14.252.65.144:8080/ajax/get_attr_value_plc'),
        body: {
          "ip_plc": '10.0.54.99',
          "id_plc": '9',
        });
    print(jsonEncode(res));


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Container(
                     margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                     padding: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.white,
                       boxShadow: [
                         BoxShadow(color: Colors.indigo, spreadRadius: 1),
                       ],
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Flexible(
                           child:   Container(
                             padding: EdgeInsets.all(5),
                             width: MediaQuery.of(context).size.width/2,
                             height: MediaQuery.of(context).size.height/4,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.white,
                               boxShadow: [
                                 BoxShadow(color: Colors.red, spreadRadius: 1),
                               ],
                             ),
                             child:  Column(
                               children: [
                                 Container(
                                   padding: EdgeInsets.all(5),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     color: Colors.white,
                                     boxShadow: [
                                       BoxShadow(color: Colors.indigo, spreadRadius: 1),
                                     ],
                                   ),
                                   child: Text("Thông tin máy bơm"),
                                 )
                               ],
                             ),
                           ),
                         ),
                         Column(
                           children: [
                             Image.asset(
                               "assets/images/bom-hoa-chat-mini-2-removebg-preview.png",
                               width: 200,
                               height: 100,
                             ),
                              if(number == 0)
                                Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 40.0,
                                )else
                                Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 40.0,
                                )
                              ,
                             ButtonBar(
                               mainAxisSize: MainAxisSize.min,
                               children: <Widget>[
                                 TextButton(
                                   style: TextButton.styleFrom(
                                     backgroundColor: Colors.pinkAccent,
                                     primary: Colors.white,
                                     //minimumSize: Size.fromHeight(50),
                                     textStyle: const TextStyle(fontSize: 20),
                                   ),
                                   onPressed: () {
                                     getUserData();
                                   },
                                   child: const Text('On'),
                                 ),
                                 TextButton(
                                   style: TextButton.styleFrom(
                                     backgroundColor: Colors.pinkAccent,
                                     primary: Colors.white,
                                     //minimumSize: Size.fromHeight(50),
                                     textStyle: const TextStyle(fontSize: 20),
                                   ),
                                   onPressed: () {
                                     getOff();
                                   },
                                   child: const Text('Off'),
                                 ),
                               ],
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.indigo, spreadRadius: 1),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                       Flexible(
                         child:   Container(
                           padding: EdgeInsets.all(5),
                           width: MediaQuery.of(context).size.width/2,
                           height: MediaQuery.of(context).size.height/4,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.white,
                             boxShadow: [
                               BoxShadow(color: Colors.red, spreadRadius: 1),
                             ],
                           ),
                           child:  Column(
                             children: [
                               Container(
                                 padding: EdgeInsets.all(5),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: Colors.white,
                                   boxShadow: [
                                     BoxShadow(color: Colors.indigo, spreadRadius: 1),
                                   ],
                                 ),
                                 child: Text("Thông tin quạt"),
                               )
                             ],
                           ),
                         ),
                       ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/1.png",
                                width: 200,
                                height: 100,
                              ),
                              if(number == 0)
                                Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 40.0,
                                )else
                                Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 40.0,
                                ),
                              ButtonBar(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      primary: Colors.white,
                                      //minimumSize: Size.fromHeight(50),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      getOnFan();
                                    },
                                    child: const Text('On'),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      primary: Colors.white,
                                      //minimumSize: Size.fromHeight(50),
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      getOffFan();
                                    },
                                    child: const Text('Off'),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
