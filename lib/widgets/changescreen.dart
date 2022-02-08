import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  late final String name;
  late final Function() onTap;
  late final String whichAccount;
  ChangeScreen(
      {required this.name, required this.onTap, required this.whichAccount});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(whichAccount),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: TextStyle(
                color: Colors.cyan, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
