import 'package:farm/components/login.dart';
import 'package:farm/widgets/changescreen.dart';
import 'package:farm/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {

  String onchangeval = "";
  void vaildation() {
    final FormState? _form = _formkey.currentState;
    if (_form!.validate()) {
      print(onchangeval);
    } else {
      print("No");
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                  height: 60,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 40,
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
                  height: 400,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value!.length < 6) {
                            return "short";
                          } else if (value == "") {
                            return "null";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "UserName",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        controller: _emailController,
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
                        controller: _phoneController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Phone",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        controller: _passwordController,
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
                              child: Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      MyButton(
                          text: "SignUp",
                          press: () {
                            vaildation();
                          }),
                      ChangeScreen(
                          name: "Login",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => Login(),
                              ),
                            );
                          },
                          whichAccount: "I have an Account"),
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
