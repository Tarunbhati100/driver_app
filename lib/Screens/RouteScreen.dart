import 'package:driver_app/AuthScreens/WelcomePage.dart';
import 'package:driver_app/Screens/HomePage.dart';
import 'package:driver_app/Screens/confirmationpage.dart';
import 'package:driver_app/Screens/driverdatalist.dart';
import 'package:driver_app/Screens/languageselect.dart';
import 'package:driver_app/firebaseServices/AuthService.dart';
import 'package:flutter/material.dart';

class RouteScreen extends StatefulWidget {
  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final _database = AuthServices();
  Widget screen;
  bool isloading = true;
  @override
  initState() {
    initializeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? Scaffold(body: Center(child: CircularProgressIndicator()))
        : screen;
  }

  initializeScreen() async {
    final user = _database.getCurrentUser();

    final driver = await _database.getUserProfile(user.uid);

    if (driver != null) {
      if (driver.profilecomplete == true) {
        // if(driver.profilephoto==""||driver.drivinglicense==""||driver.rc==""||driver.pancard=="")
        if (driver.verify == true) {
          screen = HomeScreen(
            user: driver,
          );
        } else {
          screen = Confirmationpage();
        }
      } else {
        screen = Driverdatalist(
          user: driver,
        );
      }
    } else {
      screen = WelcomePage();
    }

    setState(() {
      isloading = false;
    });
  }
}
