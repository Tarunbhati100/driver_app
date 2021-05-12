import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  void openDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new Photoclick();
        },
        fullscreenDialog: true));
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

class Photoclick extends StatefulWidget {
  final click;
  Photoclick({this.click});
  @override
  _PhotoclickState createState() => _PhotoclickState();
}

class _PhotoclickState extends State<Photoclick> {
  bool tapsave = true;
  bool tapretake = false;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        // title: const Text('Dialog Magic'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    // color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://googleflutter.com/sample_image.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "\n\nWant to use this photo?\n\n",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  TextSpan(
                      text:
                          "By tapping SAVE ,you agree that uber or a trusted vendor may collect and process your photos with technology that allows us to verify your identify.\n",
                      style: TextStyle(color: Colors.black, fontSize: 15))
                ]))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RaisedButton(
                  color: tapretake ? Colors.blue : Colors.white,
                  shape: RoundedRectangleBorder(),
                  onPressed: () => getImage,
                  //  () {

                  //   setState(() {
                  //     tapsave = false;
                  //     tapretake = true;
                  //   });
                  //   // Navigator.push(
                  //   //     context,
                  //   //     MaterialPageRoute(
                  //   //         builder: (context) => RegisterPage()));
                  // },
                  child: Text("RETAKE"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                RaisedButton(
                  color: tapsave ? Colors.blue : Colors.white,
                  shape: RoundedRectangleBorder(),
                  onPressed: () {
                    setState(() {
                      tapsave = true;
                      tapretake = false;
                    });
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("SAVE"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
