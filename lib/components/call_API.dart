import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallAPI extends StatefulWidget {
  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<CallAPI> {
  Future getUserData() async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = json.decode(response.body);
    // ignore: unused_local_variable
    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["name"], u["email"], u["useName"]);
      users.add(user);
    }
    print(jsonData);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            primary: Colors.blue,
            //minimumSize: Size.fromHeight(50),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: Text('Click meeeeee'),
          onPressed: () {
            getUserData();
          },
        ),
      ),
      /*body: Container(
          child: Card(
            child: FutureBuilder(
              future: getUserData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: Center(
                      child: Text('Loading ...'),
                    ),
                  );
                } else
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(snapshot.data[i].name),
                        );
                      });
              },
            ),
          ),
        )*/
    );
  }
}

class User {
  final String? name, email, useName;
  User(this.name, this.email, this.useName);
}
