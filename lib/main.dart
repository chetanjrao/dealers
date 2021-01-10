import 'package:dealers/components/colors.dart';
import 'package:dealers/components/fonts.dart';
import 'package:dealers/pages/bills/bills.dart';
import 'package:dealers/pages/customers/ui/c_profile.dart';
import 'package:dealers/pages/home/home.dart';
import 'package:dealers/pages/login/ui/login.dart';
import 'package:dealers/pages/login/ui/otp.dart';
import 'package:dealers/utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
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
            primaryColor: primaryColor,
            fontFamily: primaryFont,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: "/loader",
        routes: {
          "/loader": (context) => Loader(),
          "/login": (context) => Login(),
          "/customer/bills/": (context) => Bills()
        });
  }
}
