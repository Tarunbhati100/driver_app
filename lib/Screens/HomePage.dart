import 'package:driver_app/Models/user.dart';
import 'package:driver_app/Screens/homeDrawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen({this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: HomeDrawer(
        user: widget.user,
      ),
      body: Container(
        width: 10,
        height: 10,
      ),
    );
  }
}
