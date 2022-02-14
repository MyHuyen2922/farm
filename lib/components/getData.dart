import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm/Services/AuthenticationService.dart';
import 'package:flutter/material.dart';
import 'package:farm/DatabaseManager/DatabaseManager.dart';

class GetData extends StatefulWidget {
  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('profileInfo').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Text('Loading ...'),
              ),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((record) {
                return Card(
                  child: ListTile(
                    title: Text(record['name']),
                    subtitle: Text(record['phone']),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/f3ceceea449088ced181.jpg"),
                    ),
                  ),
                );
              }).toList(),
            );
        },
      )),
    );
  }
}
