import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text("Forgot Password"),
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: "Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    padding: EdgeInsets.only(left: 50.0, right: 50.0),
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.yellow[800],
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () async {
                          await auth.FirebaseAuth.instance
                              .sendPasswordResetEmail(
                                  email: _emailController.text);
                          Flushbar(
                            icon: Icon(Icons.error_outline, color: Colors.red),
                            flushbarPosition: FlushbarPosition.TOP,
                            message: " email has sent to reset password",
                            duration: Duration(seconds: 3),
                          ).show(context);
                        },
                        child: Center(
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
