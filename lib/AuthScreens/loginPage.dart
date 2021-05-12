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
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "Please Sign in",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) => _passwordController.text.isEmpty
                              ? "Please enter your email !!"
                              : null,
                          controller: _emailController,
                          decoration: InputDecoration(
                            // icon: Icon(Icons.email),
                            labelText: "Email",
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) => _passwordController.text.isEmpty
                              ? "Please enter your password !!"
                              : null,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              // icon: Icon(Icons.lock),
                              labelText: "Password",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.grey[200],
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
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
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 20,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.arrow_forward),
                            color: Colors.white,
                            onPressed: () async {
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
