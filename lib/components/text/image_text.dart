import 'package:flutter/material.dart';


class ImageText extends StatelessWidget {
  final String image;
  final String title;

  const ImageText({Key key, this.image, this.title}) : super(key: key);

  String convertTitle(String title) {
    final List<String> _subTitles = title.split(' ');
    try {
      return "${_subTitles.first.substring(0, 1) ?? ""}${_subTitles.last.substring(0, 1) ?? ""}";
    } catch(e) {
      return "AN";
    } 
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 36.0,
      backgroundImage: image != null ? const NetworkImage(
        "https://outrider.live/assets/img/Chetan.jpg"
      ) : null,
      child: image == null ? Text(
        convertTitle(title),
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold
        ),
      ) : null,
    );
  }
}
