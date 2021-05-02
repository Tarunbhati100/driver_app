import 'package:driver_app/AuthScreens/WelcomePage.dart';
import 'package:driver_app/Bloc/UserBloc.dart';
import 'package:driver_app/Bloc/UserEvent.dart';
import 'package:driver_app/Models/user.dart';
import 'package:driver_app/Screens/RouteScreen.dart';
import 'package:driver_app/firebaseServices/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserBloc _userBloc;
  bool isVisible = true;
  final _auth = AuthServices();
  bool isLoading = false;
  auth.UserCredential newUser;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

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
                  padding: EdgeInsets.all(20.0),
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
                  'Register !',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.35),
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 20.5),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) => _nameController.text.isEmpty
                                  ? "Please enter your name !!"
                                  : null,
                              controller: _nameController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                labelText: "Name",
                              ),
                              keyboardType: TextInputType.name,
                              autocorrect: false,
                            ),
                            TextFormField(
                              validator: (value) =>
                                  _emailController.text.isEmpty
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
                                  _numberController.text.isEmpty
                                      ? "Please enter your phone number!!"
                                      : null,
                              controller: _numberController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.phone_android_outlined),
                                labelText: "Phone Number",
                              ),
                              keyboardType: TextInputType.phone,
                              autocorrect: false,
                            ),
                            TextFormField(
                              validator: (value) => _cityController.text.isEmpty
                                  ? "Please enter your city!!"
                                  : null,
                              controller: _cityController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.location_city),
                                labelText: "City",
                              ),
                              keyboardType: TextInputType.name,
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
                            TextFormField(
                              validator: (value) {
                                if (value != _passwordController.text) {
                                  return "Password don't matched !!";
                                }
                                return null;
                              },
                              controller: _confirmController,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  labelText: "Confirm Password",
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
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            GestureDetector(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color:
                                              Color(0xffdf8e33).withAlpha(100),
                                          offset: Offset(2, 4),
                                          blurRadius: 8,
                                          spreadRadius: 2)
                                    ],
                                    color: Colors.green[200],
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: 20.0,
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
                                      newUser = await _auth
                                          .registerWithEmailAndPassword(
                                              emailid:
                                                  _emailController.text.trim(),
                                              password: _passwordController.text
                                                  .trim());
                                      User user = User(
                                          name: _nameController.text
                                              .toLowerCase()
                                              .trim(),
                                          email: _emailController.text
                                              .toLowerCase()
                                              .trim(),
                                          phoneNumber: _numberController.text
                                              .toLowerCase()
                                              .trim(),
                                          city: _cityController.text
                                              .toLowerCase()
                                              .trim(),
                                          password:
                                              _passwordController.text.trim());
                                      _userBloc.userEventSink.add(AddUser(
                                          user: user,
                                          userId: newUser.user.uid));
                                      if (newUser != null) {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) {
                                          return RouteScreen();
                                        }), (route) => false);
                                      }
                                    } catch (e) {
                                      Flushbar(
                                        icon: Icon(Icons.error_outline,
                                            color: Colors.red),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        message: e.toString(),
                                        duration: Duration(seconds: 3),
                                      ).show(context);
                                    } finally {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  }
                                })
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
