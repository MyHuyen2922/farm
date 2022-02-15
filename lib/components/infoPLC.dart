import 'package:flutter/material.dart';

class InfoPLC extends StatefulWidget {
  @override
  State<InfoPLC> createState() => _InfoPLCState();
}

class _InfoPLCState extends State<InfoPLC> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
              child: Column(
            children: [
              Text(
                "Thông tin PLC",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              Image(
                image: AssetImage('assets/images/plc.png'),
              ),
              Container(
                  child:
                  Row(
                      children: [
                        if(number == 0)...[
                          Icon(Icons.circle, color: Colors.green,size: 50,),
                          Icon(Icons.circle, color: Colors.red,size: 50,),
                        ]else...[
                          Text("A is less than or Equal to 10")
                        ]
                      ])
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Table(
                  border: TableBorder.all(width: 1, color: Colors.purple),
                  children: [
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Tên PLC",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "a",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Tên PLC",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "a",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "IP PLC",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "a",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Nhãn hiệu",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "a",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Chức năng",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "a",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Model",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "a",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
