import 'package:driver_app/AuthScreens/WelcomePage.dart';
import 'package:driver_app/Bloc/UserBloc.dart';
import 'package:driver_app/Models/user.dart';
import 'package:driver_app/Screens/AccountPage.dart';
import 'package:driver_app/Screens/Earning.dart';
import 'package:driver_app/Screens/Promotions.dart';
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
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.black,
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.07,
                        left: MediaQuery.of(context).size.width * 0.05),
                    color: Colors.black,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            "${widget.user.name == null ? "" : widget.user.name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700)),
                      ],
                    ))),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
                size: 30.0,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.hourglass_top_sharp,
                color: Colors.white,
                size: 30.0,
              ),
              title: Text(
                "Promotions",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PromotionsPage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              title: Text(
                "Earning",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22),
              ),
              onTap: () {
                Navigator.of(context).pop();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EarningsPage()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.wallet_travel_sharp,
                color: Colors.white,
                size: 30.0,
              ),
              title: Text(
                "Wallet",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              title: Text(
                "Account",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountPage()));
              },
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                "Help",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Tips & info",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22),
              ),
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
      ),
    );
  }
}
