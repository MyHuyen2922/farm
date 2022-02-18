import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';

class InfoPLC extends StatefulWidget {
  @override
  State<InfoPLC> createState() => _InfoPLCState();
}

class _InfoPLCState extends State<InfoPLC> {
  int number = 0;
  var data = [
    {
      "name": "Can Tho",
      "location": "location can tho",
      "child": [
        {
          "name": "Bao gia farm",
          "location": "location bao gia",
          "child": [
            {"name": "nha mang 1", "location": "location nha mang 1"},
            {"name": "nha mang 2", "location": "location nha mang 2"}
          ]
        },
        {
          "name": "Danny green",
          "location": "location danny green",
          "child": [
            {"name": "nha mang 3", "location": "location nha mang 3"}
          ]
        }
      ]
    }
  ];
  Future getData() async {
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Cần Thơ")),
        ),
        body: ListView(
          children: [...data.map((record) {
            return _data(record);
          })],
        ));
  }

  Widget _data(temp) {
    return Card(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(temp['name'].toString()),
            Text(temp['location'].toString()),
            if (temp['child'] != null)
              ...temp['child'].map((record) => _data(record))
          ],
        ));
  }
}
