import 'package:driver_app/AuthScreens/ForgotPasswordPage.dart';
import 'package:driver_app/Screens/RouteScreen.dart';
import 'package:driver_app/firebaseServices/AuthService.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthServices();
  bool isVisible = true;
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.green[200],
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.23,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60.0),
                          topRight: Radius.circular(60.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width)),
            Container(
              color: Colors.green[200],
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12,
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                'Login !',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (value) =>
                                _passwordController.text.isEmpty
                                    ? "Please enter your email !!"
                                    : null,
                            controller: _emailController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                          ),
                          TextFormField(
                            validator: (value) =>
                                _passwordController.text.isEmpty
                                    ? "Please enter your password !!"
                                    : null,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                labelText: "Password",
                                suffixIcon: IconButton(
                                  icon: isVisible
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                )),
                            obscureText: !isVisible,
                            autocorrect: false,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                          ),
                          GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Color(0xffdf8e33).withAlpha(100),
                                        offset: Offset(2, 4),
                                        blurRadius: 8,
                                        spreadRadius: 2)
                                  ],
                                  color: Colors.green),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  auth.UserCredential newUser =
                                      await _auth.signInWithEmailAndPassword(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim());
                                  if (newUser != null) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: (context) {
                                      return RouteScreen();
                                    }), (route) => false);
                                  }
                                } catch (e) {
                                  Flushbar(
                                    icon: Icon(Icons.error_outline,
                                        color: Colors.red),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    message: e.message,
                                    duration: Duration(seconds: 3),
                                  ).show(context);
                                } finally {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color(0xffdf8e33).withAlpha(100),
                                      offset: Offset(2, 4),
                                      blurRadius: 8,
                                      spreadRadius: 2)
                                ],
                                color: Colors.white),
                            child: GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordPage()));
                              },
                              child: Center(
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
