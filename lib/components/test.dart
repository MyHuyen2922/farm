import 'package:flutter/material.dart';

class DeleteWidget extends StatefulWidget {
  @override
  _DeleteWidgetState createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget> {
  List<String> _days = ['sunday', 'Monday', 'Tuesday'];
  List<Cars> dummyData = [
    Cars(
      model: 'Fiat',
      speed: '100',
      day: 'Monday',
    ),
    Cars(
      model: 'Maruti',
      speed: '120',
      day: 'Monday',
    ),
    Cars(
      model: 'Hyundai',
      speed: '130',
      day: 'Tuesday',
    ),
    Cars(
      model: 'Toyota',
      speed: '140',
      day: 'Wednesday',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: _days.length,
          itemBuilder: (_, index) {
            return ExpansionTile(
                title: Text(_days[index].toString()),
                children: [
                  ...dummyData.map((e) {
                    if (e.day == _days[index]) {
                      return Text(e.speed.toString());
                    }
                    return Container();
                  }).toList(),
                ]);
          },
        ),
      ),
    );
  }
}

class Cars {
  String? model;
  String? speed;
  String? day;
  Cars({this.model, this.day, this.speed});
}
