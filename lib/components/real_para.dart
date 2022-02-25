import 'package:flutter/material.dart';

class RealParameters extends StatelessWidget {
  const RealParameters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
             alignment: Alignment.center,
              child: Text("Thông số thực", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey),),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.indigo, spreadRadius: 1),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Text("Nhiệt độ : "),
                          SizedBox(
                            height: 10,
                          ),
                          Text("T_min : "), SizedBox(
                            height: 10,
                          ),
                          Text("T_max : "), SizedBox(
                            height: 10,
                          ),
                          Text("Độ ẩm :")

                        ],
                      )),
                      Expanded(
                          child: Column(
                            children: [
                              Text("34 °C"), SizedBox(
                                height: 10,
                              ),
                              Text("34 °C"), SizedBox(
                                height: 10,
                              ),
                              Text("34 °C"), SizedBox(
                                height: 10,
                              ),
                              Text("70%"),
                            ],
                          )),
                      Expanded(
                          child: Column(
                            children: [
                              Text("Ánh sáng :"), SizedBox(
                                height: 10,
                              ),
                              Text("Tốc độ gió :"), SizedBox(
                                height: 10,
                              ),
                              Text("Nắng :"), SizedBox(
                                height: 10,
                              ),
                              Text("pH :"),
                            ],
                          )),
                      Expanded(
                          child: Column(
                            children: [
                              Text("34 °C"), SizedBox(
                                height: 10,
                              ),
                              Text("34 °C"), SizedBox(
                                height: 10,
                              ),
                              Text("34 °C"), SizedBox(
                                height: 10,
                              ),
                              Text("0.17 pH"),
                            ],
                          )),
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
