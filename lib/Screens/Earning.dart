import 'package:flutter/material.dart';

class EarningsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PromotionsView();
  }
}

class PromotionsView extends StatefulWidget {
  @override
  _PromotionsViewState createState() => _PromotionsViewState();
}

class _PromotionsViewState extends State<PromotionsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text("Earning"),
        ),
        body: ListView(
          children: <Widget>[],
        ));
  }
}
