import 'package:flutter/material.dart';
import 'package:farm/constants.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;
  const MyButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: TextButton(
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          style: TextButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              primary: Colors.white,
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: EdgeInsets.all(15),
              alignment: Alignment.center),
        ),
      ),
    );
  }
}
