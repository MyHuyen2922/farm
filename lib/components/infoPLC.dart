import 'package:flutter/material.dart';

class InfoPLC extends StatefulWidget {
  @override
  State<InfoPLC> createState() => _InfoPLCState();
}

class _InfoPLCState extends State<InfoPLC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/plc.png'),
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
    );
  }
}
