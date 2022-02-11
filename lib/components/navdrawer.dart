import 'package:farm/Services/AuthenticationService.dart';
import 'package:farm/components/farm_nt.dart';
import 'package:farm/components/farn_ct.dart';
import 'package:farm/components/seatek.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  final AuthenticationServices _auth = AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.fromLTRB(47, 0, 0, 0),
          child: Text(
            "Khu vườn Seatek",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              child: UserAccountsDrawerHeader(
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/f3ceceea449088ced181.jpg"),
                  ),
                ),
                accountName: Text(
                  "Seatek",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                accountEmail: Text("seatek.gmail.com",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black)),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/download.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Bảo Gia Ninh Thuận"),
              trailing: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => FarmNinhThuan(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Bảo Gia Cần Thơ"),
              trailing: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => FarmCanTho(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Đăng xuất"),
              trailing: Icon(Icons.login_outlined),
              onTap: () async {
                await _auth.signOut().then((result) {
                  Navigator.pushNamed(context, '/login');
                });
              },
            ),
          ],
        ),
      ),
      body: Seatek(),
    );
  }
}
