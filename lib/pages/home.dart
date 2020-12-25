import 'package:dealers/components/components.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const InputElement(
            label: "Mobile number",
            placeholder: "10 digit mobile number",
            keyboardType: TextInputType.number
          ),
          const FLButton(
            title: "Sign in",
            isLarge: true,
            type: ButtonType.success,
            icon: Icons.arrow_forward,
          ),
        ],
      )
    );
  }
}
