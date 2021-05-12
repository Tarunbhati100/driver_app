import 'package:flutter/material.dart';

class Profiledetail extends StatefulWidget {
  @override
  _ProfiledetailState createState() => _ProfiledetailState();
}

class _ProfiledetailState extends State<Profiledetail> {
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Text("Welcome to AndroidVille!"),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uber"),
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
      body: Column(
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
                    text: "Welcome back , vicky \n",
                    style: TextStyle(color: Colors.black, fontSize: 28),
                  ),
                  TextSpan(
                    text: 'Required steps\n',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Here\'s what you need to do to set up your account',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            dense: false,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(child: Icon(Icons.pages_outlined, color: Colors.blue)),
                // VerticalDivider(),
              ],
            ),
            title: Text("Profile Photo"),
            subtitle: Text("Recommended next step"),
            onTap: () {},
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.black, size: 30.0),
          ),
          ListTile(
            dense: false,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(child: Icon(Icons.pages_outlined, color: Colors.blue)),
                // VerticalDivider(),
              ],
            ),
            title: Text("Driving License -Font"),
            subtitle: Text("Get started"),
            onTap: () {},
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.black, size: 30.0),
          ),
          ListTile(
            dense: false,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(child: Icon(Icons.pages_outlined, color: Colors.blue)),
                // VerticalDivider(),
              ],
            ),
            title: Text("PAN Card"),
            subtitle: Text("Get started"),
            onTap: () {},
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.black, size: 30.0),
          ),
          ListTile(
            dense: false,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(child: Icon(Icons.pages_outlined, color: Colors.blue)),
                // VerticalDivider(),
              ],
            ),
            title: Text("Vehicle insurance"),
            subtitle: Text("Get started"),
            onTap: () {},
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.black, size: 30.0),
          ),
          ListTile(
            dense: false,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(child: Icon(Icons.pages_outlined, color: Colors.blue)),
                // VerticalDivider(),
              ],
            ),
            title: Text("Registration Certificate(RC)"),
            subtitle: Text("Get started"),
            onTap: () {},
            trailing: Icon(Icons.keyboard_arrow_right,
                color: Colors.black, size: 30.0),
          ),
        ],
      ),
    );
  }
}
