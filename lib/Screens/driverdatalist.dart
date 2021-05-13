import 'package:driver_app/Models/user.dart';
import 'package:driver_app/Screens/profilephoto/profilephoto.dart';
import 'package:driver_app/Screens/widgets/Photoclick.dart';
import 'package:driver_app/Screens/widgets/dialoginfomation.dart';
import 'package:driver_app/Screens/widgets/helpdialog.dart';
import 'package:flutter/material.dart';

class Driverdatalist extends StatefulWidget {
  final User user;
  Driverdatalist({this.user});
  @override
  _DriverdatalistState createState() => _DriverdatalistState();
}

class _DriverdatalistState extends State<Driverdatalist> {
  void openDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new SomeDialog();
        },
        fullscreenDialog: true));
  }

  bool selecttick = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MeeCar"),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.white,
              onPressed: () => displayBottomSheet(context),
              child: Row(
                children: [
                  Text(
                    "Help",
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      setState(() {});
                    },
                    child: Center(
                      child: Card(
                        color: Colors.lightBlueAccent,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              // leading: Icon(Icons.satellite),
                              title: Text('Account activation may be delayed'),
                              subtitle: Text(
                                  'Due to COVID-19, processing document is taking longer than usual .Thanks for your patience'),
                            ),
                          ],
                        ),
                      ),
                    )),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "\nWelcome back ",
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                  TextSpan(
                      text: "${widget.user.name}",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  TextSpan(
                      text: "\n\n Required Steps\n ",
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                  TextSpan(
                      text:
                          "Here\'s what you need to do to set up your account ",
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                ])),
                ListTile(
                  leading: const Icon(Icons.perm_device_information_outlined),
                  title: Text("Profile photo"),
                  subtitle: widget.user.profilephoto != ""
                      ? Text(
                          "Completed",
                          style: TextStyle(color: Colors.green),
                        )
                      : Text(" Recommended next step"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profiledetailphoto()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.perm_device_information_outlined),
                  title: Text("Driving License-Font"),
                  subtitle: widget.user.drivinglicense != ""
                      ? Text(
                          "Completed",
                          style: TextStyle(color: Colors.green),
                        )
                      : Text(" Recommended next step"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Photoclick(
                                nameid: "drivinglicense",
                              )),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.perm_device_information_outlined),
                  title: Text("PAN Card"),
                  subtitle: widget.user.pancard != ""
                      ? Text(
                          "Completed",
                          style: TextStyle(color: Colors.green),
                        )
                      : Text(" Recommended next step"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Photoclick(
                                nameid: "pancard",
                              )),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.perm_device_information_outlined),
                  title: Text("Vehicle insurance"),
                  subtitle: widget.user.vehicleinsurance != ""
                      ? Text(
                          "Completed",
                          style: TextStyle(color: Colors.green),
                        )
                      : Text(" Recommended next step"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Photoclick(
                                nameid: "vehicleinsurance",
                              )),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.perm_device_information_outlined),
                  title: Text("Registration Certificate(RC)"),
                  subtitle: widget.user.rc != ""
                      ? Text(
                          "Completed",
                          style: TextStyle(color: Colors.green),
                        )
                      : Text(" Recommended next step"),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Photoclick(
                                nameid: "rc",
                              )),
                    );
                  },
                )
              ]),
        ),
      ),
    );
  }
}
