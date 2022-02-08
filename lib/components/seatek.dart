import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Seatek extends StatefulWidget {
  @override
  State<Seatek> createState() => _SeatekState();
}

class _SeatekState extends State<Seatek> {
  Future getUserData() async {
    //var response = await http
    http.post(
        Uri.parse('http://f609-113-163-184-116.ngrok.io/ajax/remote_device'),
        body: {
          "id_device": '9',
          "start_byte": '63',
          "bit": '4',
          "data_type": 'bool'
        });
    //var jsonData = json.decode(response.body);
    // ignore: unused_local_variabl

    //print(jsonData);
    //return jsonData;
  }

  Future getOff() async {
    http.post(
        Uri.parse('http://f609-113-163-184-116.ngrok.io/ajax/remote_device'),
        body: {
          "id_device": '9',
          "start_byte": '63',
          "bit": '5',
          "data_type": 'bool'
        });
  }

  Future getOnFan() async {
    http.post(
        Uri.parse('http://f609-113-163-184-116.ngrok.io/ajax/remote_device'),
        body: {
          "id_device": '9',
          "start_byte": '12',
          "bit": '2',
          "data_type": 'bool'
        });
  }

  Future getOffFan() async {
    http.post(
        Uri.parse('http://f609-113-163-184-116.ngrok.io/ajax/remote_device'),
        body: {
          "id_device": '9',
          "start_byte": '12',
          "bit": '3',
          "data_type": 'bool'
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
                "assets/images/pngtree-frame-flower-fresh-elegant-image_46797.jpg"),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Khu vườn Seatek",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.purple),
                    ),
                    Image.asset(
                      "assets/images/bom-hoa-chat-mini-2-removebg-preview.png",
                      width: 240,
                      height: 200,
                    ),
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
                    Image.asset(
                      "assets/images/1.png",
                      width: 240,
                      height: 200,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
