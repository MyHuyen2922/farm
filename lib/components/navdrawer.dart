import 'package:farm/Services/AuthenticationService.dart';
import 'package:farm/components/call_API.dart';
import 'package:farm/components/call_API_local.dart';
import 'package:farm/components/farm_nt.dart';
import 'package:farm/components/farn_ct.dart';
import 'package:farm/components/real_para.dart';
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

  var data = [
    {
      "name": "Can Tho",
      "location": "location can tho",
      "child": [
        {
          "name": "Bao gia farm",
          "location": "location bao gia",
          "child": [
            {"name": "nha mang 1", "location": "location nha mang 1"},
            {"name": "nha mang 2", "location": "location nha mang 2"}
          ]
        },
        {
          "name": "Danny green",
          "location": "location danny green",
          "child": [
            {"name": "nha mang 3", "location": "location nha mang 3"}
          ]
        }
      ]
    }
  ];

  final AuthenticationServices _auth = AuthenticationServices();
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    ShowWeather(),
    RealParameters(),
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
      drawer: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/Hinh-Nen-Trang-32.jpg"),
          fit: BoxFit.cover,
        )),
        height: MediaQuery.of(context).size.height,
        width: 300,
        child: ListView(
          children: [
            Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                      "assets/images/pngtree-romantic-light-purple-gradient-dreamy-background-image_548533.jpg"),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/f3ceceea449088ced181.jpg"),
                          minRadius: 30,
                          maxRadius: 35,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "SeaTek",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "seatek@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )),
            ...data.map((record) {
              return _data(record);
            })
          ],
        ),
      ),
    );
  }

  Widget _data(temp) {
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blueGrey.shade50, width: 1),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: temp['child'] == null
            ? ExpansionTile(
                trailing: const SizedBox(),
                /*title:  GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(temp['name'].toString()),
          ),*/
                title: Text(temp['name'].toString()),
                children: [
                  if (temp['child'] != null)
                    ...temp['child'].map((record) => _data(record)),
                ],
              )
            : (ExpansionTile(
                /*title:  GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(temp['name'].toString()),
          ),*/
                title: Text(temp['name'].toString()),
                children: [
                  if (temp['child'] != null)
                    ...temp['child'].map((record) => Container(
                          margin: EdgeInsets.only(left: 10),
                          child: _data(record),
                        )),
                ],
              )));
  }
}
