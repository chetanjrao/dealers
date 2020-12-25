import 'dart:io';

import 'package:dealers/components/colors.dart';
import 'package:dealers/components/components.dart';
import 'package:dealers/components/fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )
                  ),
                Container(
                    margin: const EdgeInsets.only(top: 24.0),
                    child: const Text(
                    "Enter OTP",
                    style: TextStyle(
                        fontFamily: primaryFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  )
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PinInputElement(
                    label: "Mobile number",
                    placeholder: "10 digit mobile number",
                    keyboardType: TextInputType.number),
                const FLButton(
                  title: "Proceed",
                  isLarge: true,
                  type: ButtonType.logo,
                  icon: Icons.done,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
