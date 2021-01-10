import 'dart:convert';
import 'dart:io';

import 'package:dealers/api/client.dart';
import 'package:dealers/components/colors.dart';
import 'package:dealers/components/components.dart';
import 'package:dealers/components/fonts.dart';
import 'package:dealers/pages/login/ui/otp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  String mobile = "";
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final APIClient apiClient = new APIClient();

  void processLogin(String mobile) async {
    setState(() {
      isLoading = true;
    });
    Response response = await apiClient.processLogin(mobile);
    dynamic jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => OTP(mobile: mobile)));
    } else {
      setState(() {
        isLoading = false;
      });
      key.currentState.showSnackBar(SnackBar(
        content: Text("${jsonResponse["message"]}"),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Image.asset(
                    "assets/logo-small.png",
                    width: 48.0,
                    height: 48.0,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 12.0),
                    child: const Text(
                      "Welcome to",
                      style: TextStyle(fontFamily: primaryFont),
                    )),
                const Text(
                  "FuelCharge",
                  style: TextStyle(
                      fontFamily: primaryFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputElement(
                    onChange: (v) => {
                          setState(() {
                            mobile = v;
                          })
                        },
                    maxLength: 10,
                    label: "Mobile number",
                    placeholder: "10 digit mobile number",
                    keyboardType: TextInputType.number),
                if (!isLoading)
                  FLButton(
                    onPressed: () =>
                        mobile.isNotEmpty ? processLogin(mobile) : null,
                    title: "Sign in",
                    isLarge: true,
                    type: ButtonType.logo,
                    icon: Icons.arrow_forward,
                  )
                else
                  const LoaderButton(isLarge: true, type: ButtonType.logo),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                      onTap: () async {
                        final bool _canLaunch = await canLaunch(
                            "https://console.fuelcharge.in/signup/");
                        if (_canLaunch) {
                          await launch("https://console.fuelcharge.in/signup/",
                              forceWebView: true);
                        }
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account ?   ",
                              style: TextStyle(
                                  fontFamily: primaryFont,
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 12.0)),
                          const TextSpan(
                              text: "Register here",
                              style: TextStyle(
                                  fontFamily: primaryFont,
                                  color: primaryColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold))
                        ]),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
