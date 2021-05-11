import 'package:driver_app/AuthScreens/RegisterPage.dart';
import 'package:driver_app/AuthScreens/loginPage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool tapsigin = true;
  bool tapreg = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.7,
            child: Image.asset(
              "assets/image/front.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
            child: Center(
              child: Text(
                "Welcome to the \n Driver app",
                // textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RaisedButton(
                  color: tapsigin ? Colors.blue : Colors.white,
                  shape: RoundedRectangleBorder(),
                  onPressed: () {
                    setState(() {
                      tapsigin = true;
                      tapreg = false;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("SIGN IN"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                RaisedButton(
                  color: tapreg ? Colors.blue : Colors.white,
                  shape: RoundedRectangleBorder(),
                  onPressed: () {
                    setState(() {
                      tapsigin = false;
                      tapreg = true;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text("REGISTER"),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("or Ride with Uber",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    fontStyle: FontStyle.normal,
                    decoration: TextDecoration.none)),
          )
        ],
      ),
    );
  }
}
