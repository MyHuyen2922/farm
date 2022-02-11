import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:farm/components/signup.dart';
import 'package:farm/widgets/changescreen.dart';
import 'package:farm/widgets/mybutton.dart';
import 'package:farm/Services/AuthenticationService.dart';
import 'package:farm/components/navdrawer.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
bool obserText = true;

final AuthenticationServices _auth = AuthenticationServices();

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _LoginState extends State<Login> {
  void vaildation() {
    final FormState? _form = _formkey.currentState;
    if (_form!.validate()) {
      logIn();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Message"),
              content: Text("Email không hợp lệ. Vui lòng nhập lại"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (ctx) => Login(),
                        ),
                      );
                    },
                    child: Text("Ok"))
              ],
            );
          });
    }
  }

  void logIn() async {
    dynamic result =
        await _auth.loginUser(_emailController.text, _passwordController.text);
    if (result == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Message"),
              content:
                  Text("Email hoặc mật khẩu không đúng. Vui lòng thử lại !"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (ctx) => Login(),
                        ),
                      );
                    },
                    child: Text("Ok"))
              ],
            );
          });
    } else {
      _emailController.clear();
      _passwordController.clear();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Message"),
              content: Text("Đăng nhập thành công"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/navdrawer');
                    },
                    child: Text("Ok"))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formkey,
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
                        controller: _emailController,
                        validator: (value) {
                          if (value == "") {
                            return "Null";
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
                        controller: _passwordController,
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
                          name: "Sign Up",
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                fullscreenDialog: true,
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
