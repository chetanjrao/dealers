import 'package:dealers/pages/home/home.dart';
import 'package:dealers/pages/login/ui/login.dart';
import 'package:dealers/pages/user/landing.dart';
import 'package:dealers/utils/prefs.dart';
import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  LocalPreferences preferences = LocalPreferences();
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  void navigateToRoot() async {
    final String accessToken = await preferences.getAccessToken() ?? "";
    if (accessToken.isNotEmpty) {
      Navigator.of(key.currentContext)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => Landing()));
    } else {
      Navigator.of(key.currentContext)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => Login()));
    }
  }

  @override
  void initState() {
    super.initState();
    navigateToRoot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
    );
  }
}

