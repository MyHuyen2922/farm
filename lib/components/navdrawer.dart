import 'package:farm/Services/AuthenticationService.dart';
import 'package:farm/components/call_API.dart';
import 'package:farm/components/call_API_local.dart';
import 'package:farm/components/farm_nt.dart';
import 'package:farm/components/farn_ct.dart';
import 'package:farm/components/infoPLC.dart';
import 'package:farm/components/seatek.dart';
import 'package:farm/weather/show_weather.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  final AuthenticationServices _auth = AuthenticationServices();
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    ShowWeather(),
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
      drawerEnableOpenDragGesture: false,
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
            icon: Icon(Icons.wb_sunny_rounded),
            label: 'Thời tiết',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Thông tin',
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
      drawer: MultiLevelDrawer(
          header: Container(
            child: Center(
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
          ),
          children: [
            MLMenuItem(
                trailing: Icon(Icons.arrow_right),
                onClick: () {},
                content: Text("Farm Cần Thơ"),
                subMenuItems: [
                  MLSubmenu(
                      submenuContent: Text("PLC 1"),
                      onClick: () {
                        Navigator.pop(context);
                        //Scaffold.of(context).openDrawer();
                      }),
                  MLSubmenu(submenuContent: Text("PLC 2"), onClick: () {}),
                ]),
            MLMenuItem(
                trailing: Icon(Icons.arrow_right),
                onClick: () {},
                content: Text("Farm Ninh Thuận"),
                subMenuItems: [
                  MLSubmenu(submenuContent: Text("PLC 1"), onClick: () {}),
                  MLSubmenu(submenuContent: Text("PLC 2"), onClick: () {}),
                ]),
            MLMenuItem(
                trailing: Icon(Icons.logout),
                content: Text("Đăng xuất"),
                onClick: () async {
                  await _auth.signOut().then((result) {
                    Navigator.pushNamed(context, '/login');
                  });
                }),
          ]),
    );
  }
}
