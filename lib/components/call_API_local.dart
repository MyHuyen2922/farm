import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallAPILocal extends StatefulWidget {
  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class User {
  final String? tenmon, gia, mota;
  User(this.tenmon, this.gia, this.mota);
}

class _DataFromAPIState extends State<CallAPILocal> {
  Future getUserData() async {
    var response = await http.get(Uri.http('10.0.2.2:80', 'GetItemNative.php'));
    var jsonData = json.decode(response.body);
    // ignore: unused_local_variable
    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["tenmon"], u["gia"], u["mota"]);
      users.add(user);
    }
    print(jsonData);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Danh sách sản phẩm'),
        ),
        /*body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            primary: Colors.blue,
            //minimumSize: Size.fromHeight(50),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: Text('Local'),
          onPressed: () {
            getUserData();
          },
        ),
      ),*/
        body: Container(
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
                          title: Text(snapshot.data[i].tenmon),
                          subtitle: Text(snapshot.data[i].gia),
                        );
                      });
              },
            ),
          ),
        ));
  }
}
