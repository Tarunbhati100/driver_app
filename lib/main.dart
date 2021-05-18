import 'package:driver_app/AuthScreens/WelcomePage.dart';
import 'package:driver_app/Bloc/UserBloc.dart';
import 'package:driver_app/Screens/AccountPage.dart';
import 'package:driver_app/Screens/Earning.dart';
import 'package:driver_app/Screens/Promotions.dart';
import 'package:driver_app/Screens/RouteScreen.dart';
import 'package:driver_app/firebaseServices/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      bloc: UserBloc(),
      child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/earnings': (context) => EarningsPage(),
            '/promotions': (context) => PromotionsPage(),
            '/account': (context) => AccountPage(),
          },
          title: 'DriverApp',
          theme: ThemeData(
            primaryColor: Colors.blueAccent,
            bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.black54,
            ),
            primaryIconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          home: StreamBuilder<User>(
            stream: AuthServices().user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return RouteScreen();
              } else {
                return WelcomePage();
              }
            },
          )),
    );
  }
}
