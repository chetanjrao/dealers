import 'dart:convert';
import 'dart:io';

import 'package:dealers/api/client.dart';
import 'package:dealers/components/colors.dart';
import 'package:dealers/components/components.dart';
import 'package:dealers/components/fonts.dart';
import 'package:dealers/pages/user/landing.dart';
import 'package:dealers/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OTP extends StatefulWidget {
  final String mobile;

  const OTP({Key key, @required this.mobile}) : super(key: key);

  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  bool isLoading = false;
  String otp = "";
  final GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final APIClient apiClient = APIClient();
  LocalPreferences preferences = LocalPreferences();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  void verifyLogin(String mobile, String otp) async {
    setState(() {
      isLoading = true;
    });
    Response response = await apiClient.verifyLogin(mobile, otp);
    dynamic jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      preferences.setAccessToken('${jsonResponse["access_token"]}');
      preferences.setRefreshToken('${jsonResponse["refresh_token"]}');
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Landing()), (route) => false);
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(24.0),
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
                    margin: const EdgeInsets.only(top: 12.0),
                    child: const BackButton(color: Colors.black)),
                Container(
                    margin: const EdgeInsets.only(top: 12.0),
                    child: const Text(
                      "Enter OTP",
                      style: TextStyle(
                          fontFamily: primaryFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    )),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PinInputElement(
                    onChanged: (v) => {
                          setState(() {
                            otp = v;
                          })
                        },
                    label: "One Time Password",
                    placeholder: "Enter one time password",
                    keyboardType: TextInputType.number),
                if (!isLoading)
                  FLButton(
                    onPressed: () =>
                        otp.isNotEmpty ? verifyLogin(widget.mobile, otp) : null,
                    title: "Proceed",
                    isLarge: true,
                    type: ButtonType.logo,
                    icon: Icons.done,
                  )
                else
                  const LoaderButton(isLarge: true, type: ButtonType.logo)
              ],
            )
          ],
        ),
      ),
    );
  }
}
