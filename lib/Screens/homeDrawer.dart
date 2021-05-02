import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/AuthScreens/WelcomePage.dart';
import 'package:driver_app/Bloc/UserBloc.dart';
import 'package:driver_app/Models/user.dart';
import 'package:driver_app/firebaseServices/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HomeDrawer extends StatefulWidget {
  final User user;
  HomeDrawer({this.user});
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  UserBloc _userBloc;
  void didChangeDependencies() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    super.didChangeDependencies();
  }

  final _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07,
                      left: MediaQuery.of(context).size.width * 0.05),
                  color: Colors.yellow[800],
                  child: Text(
                      "Welcome " +
                          "${widget.user.name == null ? "" : widget.user.name}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700)))),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.yellow[800],
                    size: 30.0,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              )),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.yellow[800],
            ),
            title: Text("Logout"),
            onTap: () async {
              _auth.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return WelcomePage();
              }), (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
