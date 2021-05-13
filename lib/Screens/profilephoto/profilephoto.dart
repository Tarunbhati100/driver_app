import 'package:driver_app/Screens/widgets/Photoclick.dart';
import 'package:driver_app/Screens/widgets/helpdialog.dart';
import 'package:flutter/material.dart';

class Profiledetailphoto extends StatefulWidget {
  @override
  _ProfiledetailphotoState createState() => _ProfiledetailphotoState();
}

class _ProfiledetailphotoState extends State<Profiledetailphoto> {
  void openDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new Photoclick(
            nameid: "profilephoto",
          );
        },
        fullscreenDialog: true));
  }

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
          child: Column(
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
                            title: Text('Account activation may be delayed'),
                            subtitle: Text(
                                'Due to COVID-19, processing document is taking longer than usual .Thanks for your patience'),
                          ),
                        ],
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\n\nTake your profile photo \n\n\n",
                        style: TextStyle(color: Colors.black, fontSize: 28),
                      ),
                      TextSpan(
                        text:
                            'your profile photo helps people recognize you. Please note that once you submit your profile photo it cannot be changed.\n\n\n',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      TextSpan(
                        text:
                            '1.Face the camera directly with your eyes and mouth clearly visibile\n\n',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      TextSpan(
                        text:
                            '2.Make sure the photo is well lit, free of glare, and in focus\n\n',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      TextSpan(
                        text:
                            '3.No photos of a photo , filters, or alterations\n',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width / 1.8,
                  height: MediaQuery.of(context).size.width / 1.5,
                  child: Image.asset("assets/image/front.jpeg")),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
              child: InkWell(
            onTap: () {
              openDialog();

              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => Photoclick(click: true)));
            },
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 20,
              child: Center(
                  child: Text(
                "Take photo",
                style: TextStyle(color: Colors.white),
              )),
            ),
          )),
        ));
  }
}
