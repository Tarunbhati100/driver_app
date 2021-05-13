import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Photoclick extends StatefulWidget {
  String nameid;
  Photoclick({this.nameid});
  @override
  _PhotoclickState createState() => _PhotoclickState();
}

class _PhotoclickState extends State<Photoclick> {
  bool tapsave = true;
  bool tapretake = false;
  File _imageFile;

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  var url;

  Future uploadPic(
    File _imageFile,
  ) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;

    Reference ref = storage
        .ref()
        .child(firebaseUser.uid)
        .child("DriverProfile")
        .child("${widget.nameid}" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(_imageFile);
    uploadTask.then((res) {
      // print(res);
      // print(res.ref.getDownloadURL());
      url = res.ref.fullPath;
      FirebaseFirestore.instance
          .collection("Drivers")
          .doc(firebaseUser.uid)
          .set({
        "${widget.nameid}": res.ref.fullPath,
      }, SetOptions(merge: true)).then((_) {
        print("success!");
      });
    });

    return url;
  }

  final firestoreInstance = FirebaseFirestore.instance;
  @override
  void initState() {
    // inputData();
    pickImage();

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
                Material(
                    elevation: 4.0,
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                    child: _imageFile != null
                        ? Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3,
                            child: Image.file(
                              _imageFile,
                              fit: BoxFit.fill,
                            ))
                        : Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3,
                            child: Center(child: Text("No Image")))),
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
                  onPressed: () {
                    pickImage();
                    tapsave = false;
                    tapretake = true;
                  },
                  child: Text("RETAKE"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                RaisedButton(
                  color: tapsave ? Colors.blue : Colors.white,
                  shape: RoundedRectangleBorder(),
                  onPressed: () {
                    //
                    if (_imageFile != null) {
                      setState(() {
                        tapsave = true;
                        tapretake = false;
                      });
                      uploadPic(
                        _imageFile,
                      );
                      Navigator.pop(context);
                    } else {
                      Flushbar(
                        icon: Icon(Icons.error_outline, color: Colors.red),
                        flushbarPosition: FlushbarPosition.TOP,
                        message: "Please select image",
                        duration: Duration(seconds: 3),
                      ).show(context);
                    }
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
