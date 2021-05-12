import 'package:driver_app/Screens/whatsappconnect.dart';
import 'package:flutter/material.dart';

class LegalConsent extends StatefulWidget {
  @override
  _LegalConsentState createState() => _LegalConsentState();
}

class _LegalConsentState extends State<LegalConsent> {
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
          return new SomeDialog();
        },
        fullscreenDialog: true));
  }

  bool selecttick = false;
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Legal Consent",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    ''' I understand that the information provided by me may be used by Uber, or its affiliates ("Uber"), authbridge Research Services Private Limated or its affilates (being a thrid party agency appointed by Uber .................................) 
                  '''),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              CheckboxListTile(
                title: Text(
                  "By clicking \"I accept \" or siging below (as such may be required by applicable law ..........................)",
                  style: TextStyle(fontSize: 15),
                ),
                value: selecttick,
                onChanged: (newValue) {
                  setState(() {
                    selecttick = newValue;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: selecttick
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WhatsappConnect()));
                        openDialog();
                      },
                      child: Container(
                        color: Colors.blue,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 20,
                        child: Center(child: Text("I accept/continue")),
                      ),
                    )
                  : Container(
                      color: Colors.grey,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 20,
                      child: Center(child: Text("I accept/continue")),
                    ),
            ),
          )),
    );
  }
}

class SomeDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        // title: const Text('Dialog Magic'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.golf_course),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                " Thanks For your information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
