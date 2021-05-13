import 'package:driver_app/Models/user.dart';
import 'package:driver_app/Screens/Legalconsent.dart';
import 'package:flutter/material.dart';

class Languageselect extends StatefulWidget {
  final User user;
  Languageselect({this.user});
  @override
  _LanguageselectState createState() => _LanguageselectState();
}

class _LanguageselectState extends State<Languageselect> {
  static const _lang = [
    'English',
    'French',
    'Hindi',
  ];
  var _selectedlang;
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

  bool selectlang = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carmee"),
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
                                title:
                                    Text('Account activation may be delayed'),
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
                    "Select your language ",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  Text(
                    "you can change your language on this screen \n or anytime in Help.",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Text(
                    "Language",
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Language',
                          labelStyle: Theme.of(context)
                              .primaryTextTheme
                              .caption
                              .copyWith(color: Colors.black),
                          border: const OutlineInputBorder(),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            isDense: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            value: _selectedlang,
                            items: _lang.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Center(child: Text(item)),
                              );
                            }).toList(),
                            onChanged: (selectedItem) {
                              setState(() {
                                _selectedlang = selectedItem;
                                selectlang = true;
                              });
                            },
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: selectlang
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LegalConsent()));
                      },
                      child: Container(
                        color: Colors.blue,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 20,
                        child: Center(child: Text("Continue")),
                      ),
                    )
                  : Container(
                      color: Colors.grey,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 20,
                      child: Center(child: Text("Continue")),
                    ),
            ),
          )),
    );
  }
}
