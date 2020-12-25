import 'package:dealers/components/fonts.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, success, danger, disabled, logo }

const Map<ButtonType, Color> _btnColors = {
  ButtonType.primary: Color(0xFF0B69FF),
  ButtonType.logo: Color(0xFF35D478),
  ButtonType.success: Color(0xFF35C112),
  ButtonType.danger: Color(0xFFE80B26),
  ButtonType.disabled: Color(0xFFB0AAB3)
};

class FLButton extends StatelessWidget {
  final String title;
  final ButtonType type;
  final bool isLarge;
  final IconData icon;

  const FLButton(
      {Key key, this.type = ButtonType.primary, @required this.title, this.isLarge = false, this.icon})
      : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: FlatButton(
        onPressed: () => null,
        minWidth: isLarge ? MediaQuery.of(context).size.width * 0.9 : null ,
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 36.0),
        color: _btnColors[type],
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: primaryFont,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
