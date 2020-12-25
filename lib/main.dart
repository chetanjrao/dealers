import 'package:dealers/pages/home.dart';
import 'package:dealers/pages/login/ui/login.dart';
import 'package:dealers/pages/login/ui/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white
      )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FuelCharge',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: "/otp",
        routes: {
          "/home": (context) => Home(),
          "/login": (context) => Login(),
          "/otp": (context) => OTP()
        });
  }
}
