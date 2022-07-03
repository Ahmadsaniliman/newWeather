import 'package:flutter/material.dart';

class ImageCover extends StatelessWidget {
  const ImageCover({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assests/images/weather3.jfif',
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
