import 'package:driver_app/Screens/driverdatalist.dart';
import 'package:driver_app/Screens/widgets/dialoginfomation.dart';
import 'package:driver_app/Screens/widgets/helpdialog.dart';
import 'package:flutter/material.dart';

class WhatsappConnect extends StatefulWidget {
  @override
  _WhatsappConnectState createState() => _WhatsappConnectState();
}

class _WhatsappConnectState extends State<WhatsappConnect> {
  void openDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new SomeDialog();
        },
        fullscreenDialog: true));
  }

  bool selectlang = false;
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
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    title: Text(
                                        'Account activation may be delayed'),
                                    subtitle: Text(
                                        'Due to COVID-19, processing document is taking longer than usual .Thanks for your patience'),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      Text(
                        "Connect with Uber through \n WhatsApp ",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Text(
                        "Tap Continue to enable WhatsApp and receive one-on-one support from uber to help you setup your account",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Center(child: Icon(Icons.whatshot_sharp)),
                      Center(child: Text("Whatsapp Image"))
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.grey,
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 20,
                                child: Center(
                                    child: Text(
                                  "Don\'t enable",
                                  style: TextStyle(color: Colors.black),
                                )),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Driverdatalist()));
                              openDialog();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.black,
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 20,
                                child: Center(
                                    child: Text(
                                  "continue",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ])),
    );
  }
}
