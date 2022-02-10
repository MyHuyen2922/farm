import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:farm/components/signup.dart';
import 'package:farm/widgets/changescreen.dart';
import 'package:farm/widgets/mybutton.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginState extends State<Login> {
  void vaildation() {
    final FormState? _form = _formkey.currentState;
    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value == "") {
                            return "null";
                          } else if (!regExp.hasMatch(value!)) {
                            return "Email is Invaild";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        onChanged: (text) {
                          print("$text");
                        },
                        obscureText: obserText,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obserText = !obserText;
                                });
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(Icons.visibility),
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      MyButton(
                          text: "Login",
                          press: () {
                            vaildation();
                          }),
                      ChangeScreen(
                          name: "SignUp",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => SignUp(),
                              ),
                            );
                          },
                          whichAccount: "I have not Account"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
