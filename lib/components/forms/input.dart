import 'package:dealers/components/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class InputElement extends StatelessWidget {
  final String placeholder;
  final String label;
  final TextInputType keyboardType;

  const InputElement(
      {Key key, 
        @required this.placeholder, 
        @required this.label,
        @required this.keyboardType
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontFamily: primaryFont,
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.6)),
            ),
            TextFormField(
              keyboardType: keyboardType,
              style: const TextStyle(fontFamily: primaryFont, fontSize: 16),
              cursorWidth: 1.0,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 14.0, bottom: 21.0, left: 8.0),
                hintText: placeholder,
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 23, maxHeight: 20),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(
                    MaterialCommunityIcons.account_outline,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.2)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 0.2)),
                hintStyle: TextStyle(
                    fontFamily: primaryFont,
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.24)),
              ),
            ),
          ],
        ));
  }
}
