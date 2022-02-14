import 'package:farm/Services/AuthenticationService.dart';
import 'package:farm/components/call_API.dart';
import 'package:farm/components/call_API_local.dart';
import 'package:farm/components/farm_nt.dart';
import 'package:farm/components/farn_ct.dart';
import 'package:farm/components/infoPLC.dart';
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    InfoPLC(),
    Seatek(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khu Vườn Seatek'),
        backgroundColor: Colors.indigo[300],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.aod_outlined),
            label: 'Control',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.indigo[300],
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
    );
  }
}
