import 'package:dealers/components/colors.dart';
import 'package:dealers/components/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinInputElement extends StatelessWidget {
  final String placeholder;
  final String label;
  final TextInputType keyboardType;
  final void Function(String) onChanged;

  const PinInputElement(
      {Key key,
      @required this.placeholder,
      @required this.label,
      @required this.keyboardType,
      this.onChanged
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        child: PinPut(
          onChanged: onChanged,
          textStyle: const TextStyle(
            fontFamily: primaryFont,
            fontSize: 24,
          ),
          fieldsCount: 6,
          separator: const SizedBox(width: 0.0),
          selectedFieldDecoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: logoColor)),
          ),
          submittedFieldDecoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: logoColor)),
          ),
          followingFieldDecoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.black.withOpacity(0.24))),
          ),
        ));
  }
}
