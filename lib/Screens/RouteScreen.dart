import 'package:driver_app/AuthScreens/WelcomePage.dart';
import 'package:driver_app/Bloc/UserBloc.dart';
import 'package:driver_app/Bloc/UserEvent.dart';
import 'package:driver_app/Models/user.dart';
import 'package:driver_app/Screens/HomePage.dart';
import 'package:driver_app/Screens/confirmationpage.dart';
import 'package:driver_app/Screens/driverdatalist.dart';
import 'package:driver_app/firebaseServices/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class RouteScreen extends StatefulWidget {
  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  UserBloc _userBloc;

  void didChangeDependencies() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.userEventSink
        .add(FetchUser(userId: AuthServices().getCurrentUser().uid));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _userBloc.userDataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final User driver = snapshot.data;
            if (driver != null) {
              if ((driver.profilephoto != "" &&
                  driver.drivinglicense != "" &&
                  driver.rc != "" &&
                  driver.pancard != "" &&
                  driver.vehicleinsurance != "")) {
                if (driver.verify) {
                  return MyHomePage(
                    user: driver,
                  );
                } else {
                  return Confirmationpage();
                }
              } else {
                return Driverdatalist(
                  user: driver,
                );
              }
            } else {
              return WelcomePage();
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
